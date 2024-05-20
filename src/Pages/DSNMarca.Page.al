page 50153 DSNMarcaPage
{
    Caption = 'Brand';
    PageType = List;
    ApplicationArea = All;
    //UsageCategory = Administration;
    SourceTable = DSNDatosAuxiliares;
    SourceTableView = WHERE(DSNTipoRegistro = CONST(Marca));

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