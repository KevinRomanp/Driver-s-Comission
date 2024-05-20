pageextension 50155 PostedSalesInvoicesPageExt extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Amount Including VAT")
        {
            field(TotalComision; rec.TotalComision)
            {
                ApplicationArea=  all;
            }
        }
        addafter ("DSNFecha vencimiento NCF")
        {
            field(DSNCodigo;Rec.DSNCodigo)
            {
                ApplicationArea = all;
            }
            field(DSNDescripcion;Rec.DSNDescripcion)
            {
                ApplicationArea = all;
            }
            field(DSNPlaca;Rec.DSNPlaca)
            {
                ApplicationArea= all;
            }
            field(DSNChasis;Rec.DSNChasis)
            {
                ApplicationArea = all;
            }
            field(DSNTipoVehiculo;Rec.DSNTipoVehiculo)
            {
                ApplicationArea=all;
            }
            field(DSNMarca;Rec.DSNMarca)
            {
                ApplicationArea = all;
            }
            field(DSNModelo;Rec.DSNModelo)
            {
                ApplicationArea = all;
            }
            field(DSNFicha;Rec.DSNFicha)
            {
                ApplicationArea = all;
            }
        }
    }
}