page 50150 "DSNEquipoPage"
{
    Caption = 'Equipment';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = DSNEquipos;

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
                    ApplicationArea = All;
                }
                field(DSNPlaca; Rec.DSNPlaca)
                {
                    ApplicationArea = All;
                }
                field(DSNChasis; Rec.DSNChasis)
                {
                    ApplicationArea = All;
                }
                field("DSNCliente o Propietario"; Rec."DSNCliente o Propietario")
                {
                    ApplicationArea = All;
                }
                field(DSNTipoVehiculo; Rec.DSNTipoVehiculo)
                {
                    ApplicationArea = all;
                }
                field(DSNMarca; Rec.DSNMarca)
                {
                    ApplicationArea = All;
                }
                field(DSNModelo; Rec.DSNModelo)
                {
                    ApplicationArea = All;
                }
                field(DSNFicha; Rec.DSNFicha)
                {

                }

            }
        }
    }
}