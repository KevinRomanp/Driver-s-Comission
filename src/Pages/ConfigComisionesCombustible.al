page 50154 "Config. Comisiones Combustible"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Config. Comision Combustibles";
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(all)
            {
                field(Producto; Rec.Producto)
                {
                    ApplicationArea = all;
                }
                field("Unidad de medida"; Rec."Unidad de medida")
                {
                    ApplicationArea = all;
                }
                field("Comisión base x GL"; Rec."Comisión base x GL")
                {
                    ApplicationArea = all;
                }

                field("Porcentaje dia laborable"; Rec."Porcentaje dia laborable")
                {
                    ApplicationArea = all;
                }

            }
        }
    }
}
