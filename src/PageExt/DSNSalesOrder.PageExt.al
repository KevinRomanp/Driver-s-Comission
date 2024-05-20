pageextension 50153 DSNSalesOrderPageExt extends "Sales Order"
{
    layout
    {
        addafter("Invoice Details")
        {
            group(Equipos)
            {
                Caption = 'Equipment';
                field(DSNCodigo; Rec.DSNCodigo)
                {
                    ApplicationArea = all;
                }
                field("Descripcion"; rec.DSNDescripcion)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Placa"; rec.DSNPlaca)
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field("Chasis"; rec.DSNChasis)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Tipo"; rec.DSNTipoVehiculo)
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field("Marca"; rec.DSNMarca)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Modelo"; rec.DSNModelo)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Ficha"; rec.DSNFicha)
                {
                    ApplicationArea = all;
                    Editable = false;
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