tableextension 50155 SalesInvoiceLine extends "Sales Invoice Line"
{
    fields
    {
        field(50000; "Monto Comision"; Decimal)
        {
            Caption = 'MontoComision';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}
