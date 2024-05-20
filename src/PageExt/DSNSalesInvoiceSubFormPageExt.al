pageextension 50160 DSNSalesInvoiceSubFormPageExt extends "Sales Invoice Subform"
{
    layout
    {
        modify("Line Discount %")
        {
            Editable = RolEditarDescuento;
        }
        modify("Unit Price")
        {
            Editable = RolEditarPrecio;
        }
        modify("Line Amount")
        {
            Editable = RolEditarPrecio;
        }
        modify("Line Discount Amount")
        {
            Editable = RolEditarDescuento;
        }
    }

    trigger OnOpenPage()
    begin
        RolEditarDescuento := false;
        RolEditarPrecio := false;
    end;

    trigger OnAfterGetRecord()
    begin
        UserSetupRecord.Reset();
        if UserSetupRecord.Get(UserId()) then begin
            if UserSetupRecord."Editar precios" = true then
                RolEditarPrecio := true;

            if UserSetupRecord."Editar % descuentos" = true then
                RolEditarDescuento := true;
        end;

    end;

    var
        RolEditarDescuento: Boolean;
        RolEditarPrecio: Boolean;
        RolEditarImporteLinea: Boolean;
        UserSetupRecord: Record "User Setup";

    trigger OnAfterGetCurrRecord()
    begin
        CalculoComisionesComb.GetInvoiceKeys(rec."Document Type", rec."Document No.");
        CalculoComisionesComb.CalcularComisison();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CalculoComisionesComb.CalcularComisison();
        CurrPage.Update();
    end;

    var
        CalculoComisionesComb: codeunit CalculoComisionesCombustibles;
}
