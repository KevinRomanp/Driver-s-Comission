table 50151 DSNDatosAuxiliares
{
    //LookupPageId = DSNDatosAuxiliaresPage;
    DataCaptionFields = DSNTipoRegistro;
    DrillDownPageId = DSNDatosAuxiliaresPage;
    Caption = 'Auxiliary data';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "DSNTipoRegistro"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Tipo de Vehiculo",Marca;
            Caption = 'Tipo de registro';
        }
        field(2; "DSNCodigo"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(3; "DSNDescripcion"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; DSNTipoRegistro, DSNCodigo)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Dropdown; DSNCodigo, DSNDescripcion)
        { }
    }
}