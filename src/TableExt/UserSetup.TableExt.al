/// <summary>
/// TableExtension ExtUserSetup (ID 50011) extends Record User Setup //OriginalId.
/// </summary>
tableextension 50156 "ExtUserSetup" extends "User Setup" //OriginalId
{

    fields
    {
        field(50000; Firmas; Blob)
        {
            Caption = 'Firmas';
            Subtype = Bitmap;
            DataClassification = ToBeClassified;
        }
        field(50001; "Editar precios"; Boolean)
        {
            Caption = 'Edita precios';
            DataClassification = ToBeClassified;
        }
        field(50002; "Editar % descuentos"; Boolean)
        {
            Caption = 'Edita descuentos';
            DataClassification = ToBeClassified;
        }
        field(50003; "Supervisor Cajeros"; Boolean)
        {
            Caption = 'Supervisor Cajeros';
            DataClassification = ToBeClassified;
        }
    }
}