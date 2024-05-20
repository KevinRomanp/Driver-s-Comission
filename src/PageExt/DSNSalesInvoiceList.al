pageextension 50164 SalesInvoiceList extends "Sales Invoice List"
{
    layout
    {
        addlast(Control1)
        {
            field(TotalComision; Rec.TotalComision)
            {
                ApplicationArea = all;
            }
        }
    }
}
