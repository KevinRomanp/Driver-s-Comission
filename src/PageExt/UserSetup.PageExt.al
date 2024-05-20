/// <summary>
/// PageExtension PageExtUserSetup (ID 50011) extends Record PageName //OriginalId.
/// </summary>
pageextension 50165 "PageExtUserSetup" extends "User Setup" //OriginalId
{
    layout
    {
        addafter(PhoneNo)
        {
            field(Firmas; Rec.Firmas)
            {
                ApplicationArea = All;
                //Style = Strong;

            }
        }
        addafter("Aprueba Proyectos")
        {
            field("Modifica precios"; Rec."Editar precios")
            {
                ApplicationArea = All;
                ToolTip = 'Indica si el usuario puede editar los precios de los productos';
            }
            field("Modifica descuentos"; Rec."Editar % descuentos")
            {
                ApplicationArea = All;
                ToolTip = 'Indica si el usuario puede editar los descuentos de los productos';
            }
            field("Supervisor Cajeros"; Rec."Supervisor Cajeros")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addlast(Navigation)
        {
            action(Addfirma)
            {
                ApplicationArea = All;
                Caption = 'Agregar Firma', comment = 'ESM="Agregar Firma"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Signature;

                trigger OnAction()
                var
                    Pfirma: Page "Page Signature";
                    UserSetup: Record "User Setup";
                begin
                    CLEAR(Pfirma);
                    UserSetup.Reset();
                    UserSetup.SetRange("User ID", Rec."User ID");
                    UserSetup.FindFirst();
                    Pfirma.SetTableView(UserSetup);
                    Pfirma.SetRecord(UserSetup);
                    if Pfirma.RunModal() = ACTION::OK then begin

                    end;

                end;
            }
        }
    }
}