pageextension 50150 DSNPostedSalesInvoicePageExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Invoice Details")
        {
            group(Equipment)
            {
                Caption = 'Equipment';

                field("Codigo"; rec.DSNCodigo)
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
        addlast(General)
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                ApplicationArea = all;
            }
            field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                ApplicationArea = all;
            }
        }
    }
}