table 50152 "Config. Comision Combustibles"
{
    Caption = 'Config. Comision Combustibles';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Unidad de medida"; Code[10])
        {
            Caption = 'Unidad de medida';
            DataClassification = AccountData;
            TableRelation = "Unit of Measure";
        }
        field(2; "Porcentaje dia laborable"; Decimal)
        {
            Caption = 'Porcentaje comisión';
            DataClassification = AccountData;
        }
        field(3; Producto; code[20])
        {
            Caption = 'Producto';
            DataClassification = AccountData;
            TableRelation = Item."No.";
            trigger OnValidate()
            var
                GenProdPostingGroup: record "Gen. Product Posting Group";
                errorTipoProducto: label 'Por favor introduzca un producto tipo "Servicio de transporte.';
                Item: record Item;
            begin
                Item.Reset();
                Item.SetRange("No.", Rec.Producto);
                Item.FindFirst();
                GenProdPostingGroup.Reset();
                GenProdPostingGroup.SetRange(code, item."Gen. Prod. Posting Group");
                GenProdPostingGroup.FindFirst();
                if GenProdPostingGroup.Code <> 'SERV TRANSPORTE' then //TODO: hardcode
                    Error(errorTipoProducto);
            end;
        }
        field(4; Code; code[20])
        {
            DataClassification = AccountData;
        }
        field(5; "Comisión base x GL"; Decimal)
        {
            Caption = 'Comisión base x GL';
            DataClassification = AccountData;
        }

    }
    keys
    {
        key(PK; Producto)
        {
            Clustered = true;
        }
    }
}
