pageextension 50152 DSNSalesInvoicePageExt extends "Sales Invoice"
{
    layout
    {
        addafter("Invoice Details")
        {
            group(Equipo)
            {
                Caption = 'Equipment';
                field(DSNCodigo; Rec.DSNCodigo)
                {
                    ApplicationArea = all;
                }
                field("Descripcion"; rec.DSNDescripcion)
                {
                    ApplicationArea = all;
                }
                field("Placa"; rec.DSNPlaca)
                {
                    ApplicationArea = all;
                }

                field("Chasis"; rec.DSNChasis)
                {
                    ApplicationArea = all;
                }
                field("Tipo"; rec.DSNTipoVehiculo)
                {
                    ApplicationArea = all;
                }

                field("Marca"; rec.DSNMarca)
                {
                    ApplicationArea = all;
                }
                field("Modelo"; rec.DSNModelo)
                {
                    ApplicationArea = all;
                }
                field("Ficha"; rec.DSNFicha)
                {
                    ApplicationArea = all;
                }
            }
        }
        addafter("Shipment Date")
        {
            field(HoraEnvio; Rec.HoraEnvio)
            {
                ApplicationArea = all;
                ShowMandatory = true;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        calculoComisisonesComb: Codeunit CalculoComisionesCombustibles;
    begin
        calculoComisisonesComb.GetInvoiceKeys(rec."Document Type", rec."No.");
    end;

    trigger OnModifyRecord(): Boolean
    var
        calculoComisisonesComb: Codeunit CalculoComisionesCombustibles;
    begin
        calculoComisisonesComb.GetInvoiceKeys(rec."Document Type", rec."No.");
        calculoComisisonesComb.CalcularComisison();
    end;
}