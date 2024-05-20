codeunit 50152 CalculoComisionesCombustibles
{
    Permissions =
        tabledata "Config. Comision Combustibles" = R,
        tabledata Date = R,
        tabledata DSNDiasFestivos = R,
        tabledata "Hist. Comisiones Combustibles" = RI,
        tabledata "Sales Header" = R,
        tabledata "Sales Invoice Header" = R,
        tabledata "Sales Line" = RM;

    var

        ConfigComisionCombustibles: record "Config. Comision Combustibles";
        HistComisionesCombustibles: record "Hist. Comisiones Combustibles";
        SalesLine: record "Sales Line";
        SalesHeader: record "Sales Header";
        CustomizedCalendar: record "Customized Calendar Change";

        Fecha: Record Date;
        DiasFestivos: record DSNDiasFestivos;

        TipoDoc2: enum "Sales Document Type";
        NoDoc2: Code[20];
        DobleComision: Boolean;
        AvisoComision: Label 'AVISO: Se seleccionó un servicio de transporte al cual no se le calcula comisión. Sí desea calcular la comisión, favor configurar el producto en "Config. Comisiones Combustible.';


    [Scope('Cloud')]

    procedure CalcularComisison(): Decimal
    begin

        SalesHeader.Reset;
        salesHeader.SetRange("No.", NoDoc2);
        SalesHeader.SetRange("Document Type", TipoDoc2);
        SalesHeader.FindFirst();

        DiasFestivos.reset();
        DiasFestivos.setRange(Fecha, SalesHeader."Shipment Date");
        if DiasFestivos.FindFirst() then
            DobleComision := true;

        Fecha.Reset();
        fecha.SetRange("Period Type", fecha."Period Type"::Date);
        Fecha.SetRange("Period Start", SalesHeader."Shipment Date");
        fecha.FindFirst();
        if (Fecha."Period No." = 6) and (SalesHeader.HoraEnvio >= 160000T) then
            DobleComision := true
        else
            if (Fecha."Period No." = 7) then
                DobleComision := true;

        SalesLine.Reset();
        SalesLine.SetRange("Document Type", TipoDoc2);
        SalesLine.SetRange("Document No.", NoDoc2);
        SalesLine.SetRange("Gen. Prod. Posting Group", 'SERV TRANSPORTE');
        if SalesLine.FindSet() then
            repeat
                ConfigComisionCombustibles.Reset();
                ConfigComisionCombustibles.SetRange(Producto, SalesLine."No.");
                if ConfigComisionCombustibles.FindFirst() then begin
                    if DobleComision = false then
                        SalesLine."Monto Comision" := ConfigComisionCombustibles."Comisión base x GL" * SalesLine.Quantity * (ConfigComisionCombustibles."Porcentaje dia laborable" / 100)
                    else
                        SalesLine."Monto Comision" := ((ConfigComisionCombustibles."Comisión base x GL") * SalesLine.Quantity * (ConfigComisionCombustibles."Porcentaje dia laborable" / 100) * 2) 
                end
                else
                    Message(AvisoComision);

                SalesLine.Modify();
            until SalesLine.Next() = 0;


    end;

    [Scope('Cloud')]
    procedure GetInvoiceKeys(TipoDoc: enum "Sales Document Type"; var NoDoc: Code[20])
    begin
        TipoDoc2 := TipoDoc;
        NoDoc2 := NoDoc;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnRunOnBeforePostICGenJnl', '', false, false)]
    local procedure OnRunOnBeforePostICGenJnl(var SalesHeader: Record "Sales Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; var SrcCode: Code[10]; var GenJnlLineDocType: Enum "Gen. Journal Document Type"; GenJnlLineDocNo: Code[20])
    var
    begin

        //SalesHeader.TestField(HoraEnvio);
        SalesLine.Reset();
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange("Gen. Prod. Posting Group", 'SERV TRANSPORTE');
        if SalesLine.FindSet() then
            repeat
                HistComisionesCombustibles.Init();
                HistComisionesCombustibles.Cantidad := SalesLine.Quantity;
                HistComisionesCombustibles.Comision := SalesLine."Monto Comision";
                HistComisionesCombustibles."Descripcion Producto" := SalesLine.Description;
                HistComisionesCombustibles.Fecha := SalesLine."Shipment Date";
                HistComisionesCombustibles.Importe := SalesLine."Amount Including VAT";
                HistComisionesCombustibles."No. Documento" := SalesInvoiceHeader."No.";
                HistComisionesCombustibles.NoProducto := SalesLine."No.";
                HistComisionesCombustibles.Transportista := SalesHeader."Shipping Agent Code";
                HistComisionesCombustibles."Unidad de medida" := SalesLine."Unit of Measure Code";
                HistComisionesCombustibles.Vendedor := SalesHeader."Salesperson Code";
                HistComisionesCombustibles.Insert();
            until SalesLine.Next() = 0;
    end;


}
