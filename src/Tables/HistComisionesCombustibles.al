table 50153 "Hist. Comisiones Combustibles"
{
    Caption = 'Hist. Comisiones Combustibles';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. Documento"; Code[40])
        {
            Caption = 'No. Documento';
            DataClassification = AccountData;
        }
        field(2; Transportista; Text[50])
        {
            Caption = 'Transportista';
            DataClassification = AccountData;
        }
        field(3; Importe; Decimal)
        {
            Caption = 'Importe';
            DataClassification = AccountData;
        }
        field(4; Comision; Decimal)
        {
            Caption = 'Comision';
            DataClassification = AccountData;
        }
        field(5; Fecha; Date)
        {
            Caption = 'Fecha';
            DataClassification = AccountData;
        }
        field(6; NoProducto; Code[20])
        {
            Caption = 'No. Producto';
            DataClassification = AccountData;
        }
        field(7; "Descripcion Producto"; text[50])
        {
            Caption = 'Descripcion Producto';
            DataClassification = AccountData;
        }
        field(8; Cantidad; Decimal)
        {
            Caption = 'Cantidad';
            DataClassification = AccountData;
        }
        field(9; "Unidad de medida"; code[10])
        {
            Caption = 'Unidad de medida';
            DataClassification = ToBeClassified;
        }
        field(10; "Vendedor"; text[50])
        {
            Caption = 'Vendedor';
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(PK; "No. Documento")
        {
            Clustered = true;
        }
    }
}
