table 50150 DSNEquipos
{
    DataClassification = CustomerContent;
    LookupPageId = DSNEquipoPage;
    Caption = 'Equipment';
    DrillDownPageId = DSNEquipoPage;

    fields
    {
        field(1; "DSNCodigo"; Code[25])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "DSNDescripcion"; text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "DSNPlaca"; Code[10])
        {
            Caption = 'Plate';
            DataClassification = CustomerContent;
        }
        field(4; "DSNChasis"; Code[30])
        {
            Caption = 'Chassis';
            DataClassification = CustomerContent;
        }
        field(5; "DSNCliente o Propietario"; Text[100])
        {
            Caption = 'Client or Owner';
            DataClassification = CustomerContent;
        }
        field(6; "DSNTipoVehiculo"; Code[20])
        {
            Caption = 'Vehicle type';
            TableRelation = DSNDatosAuxiliares.DSNCodigo WHERE (DSNTipoRegistro = const("Tipo de Vehiculo"));
            DataClassification = CustomerContent;
            trigger OnLookup()
            begin
                if PAGE.RunModal(page::DSNTipoDeVehiculoPage, DatosAux) = ACTION::LookupOK then
                    Validate(DSNTipoVehiculo, DatosAux.DSNCodigo);
            end;
             
            trigger OnValidate()
            begin
                if DSNTipoVehiculo <> '' then
                    DatosAux.Get(datosaux.DSNTipoRegistro::"Tipo de Vehiculo",DSNTipoVehiculo);
            end;
        }
        field(7; "DSNMarca"; Code[20])
        {
            Caption = 'Brand';
            TableRelation = DSNDatosAuxiliares.DSNCodigo WHERE (DSNTipoRegistro =const(Marca));
            DataClassification = CustomerContent;
            trigger OnLookup()
            begin
                if PAGE.RunModal(page::DSNMarcaPage, DatosAux) = ACTION::LookupOK then
                    Validate(DSNMarca, DatosAux.DSNCodigo);
            end;
             
            trigger OnValidate()
            begin
                if DSNMarca <> '' then
                    DatosAux.Get(datosaux.DSNTipoRegistro::Marca, DSNMarca);
            end;
        }
        field(8; "DSNModelo"; Code[20])
        {
            Caption = 'Model';
            DataClassification = CustomerContent;
        }
        field(9; "DSNFicha"; Code[15])
        {
            Caption = 'Registration';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; DSNCodigo)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {

        fieldgroup(DropDown; DSNCodigo,DSNDescripcion,DSNChasis)
        {
        }
        fieldgroup(Brick; DSNCodigo,DSNDescripcion,DSNChasis)
        {
        }
    }
    var
        DatosAux: Record DSNDatosAuxiliares;
    
}
