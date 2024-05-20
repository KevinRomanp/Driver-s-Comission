tableextension 50154 DSNSalesLine extends "Sales Line"
{
    fields
    {
        field(50000; "Monto Comision"; Decimal)
        {
            Caption = 'Monto Comisión';
            DataClassification = CustomerContent;
            Editable = false;
        }
        
    }
    
}
