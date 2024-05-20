page 50152 "DSNTipoDeVehiculoPage"
{
    Caption = 'Vehicle type';
    PageType = List;
    ApplicationArea = All;
    //UsageCategory = Administration;
    SourceTable = DSNDatosAuxiliares;
    SourceTableView = WHERE(DSNTipoRegistro = CONST("Tipo de Vehiculo"));

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(DSNCodigo; Rec.DSNCodigo)
                {
                    ApplicationArea = All;
                }
                field(DSNDescripcion; Rec.DSNDescripcion)
                {
                    ApplicationArea = all;
                }

            }
        }
    }
}