page 50155 "Hist. Comisiones Combustibles"
{
    ApplicationArea = All;
    Caption = 'Hist. Comisiones Combustibles';
    PageType = List;
    SourceTable = "Hist. Comisiones Combustibles";
    Editable = false;
    RefreshOnActivate = true;
    UsageCategory = History;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No. factura"; Rec."No. Documento")
                {
                    ToolTip = 'Specifies the value of the Documento No. Field.';
                }
                field(Fecha; Rec.Fecha)
                {
                    ToolTip = 'Specifies the value of the Fecha field.';
                }
                field(NoProducto; Rec.NoProducto)
                {
                    ToolTip = 'Specifies the value of the No. Producto field.';
                }
                field("Descripcion Producto"; Rec."Descripcion Producto")
                {
                    ToolTip = 'Specifies the value of the Descripcion Producto field.';
                }
                field(Cantidad; Rec.Cantidad)
                {
                    ToolTip = 'Specifies the value of the Cantidad field.';
                }
                field(Importe; Rec.Importe)
                {
                    ToolTip = 'Specifies the value of the Importe field.';
                }
                field(Comision; Rec.Comision)
                {
                    ToolTip = 'Specifies the value of the Comision field.';
                }
                field("Unidad de medida"; Rec."Unidad de medida")
                {
                    ToolTip = 'Specifies the value of the Unidad de medida field.';
                }
                field(Vendedor; Rec.Vendedor)
                {
                    ToolTip = 'Specifies the value of the Vendedor field.';
                }
                field(Transportista; Rec.Transportista)
                {
                    ToolTip = 'Specifies the value of the Transportista field.';
                }
            }
        }
    }
}
