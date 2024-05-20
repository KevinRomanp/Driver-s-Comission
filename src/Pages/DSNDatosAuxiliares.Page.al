page 50151 DSNDatosAuxiliaresPage
{
    Caption = 'Datos Auxiliares';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = DSNDatosAuxiliares;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(DSNTipoRegistro; Rec.DSNTipoRegistro)
                {
                    ApplicationArea = all;
                }
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
    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
        CurrPage.Caption := Format(rec."DSNTipoRegistro");
    end;
}