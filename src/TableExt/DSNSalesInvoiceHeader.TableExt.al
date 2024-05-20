tableextension 50151 DSNSalesInvoiceHeaderTableExt extends "Sales Invoice Header"
{
    fields
    {
        field(50001; "DSNCodigo"; Code[25])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            TableRelation = DSNEquipos;
            trigger OnValidate()
            var
                Equipos: Record DSNEquipos;

            begin
                if Equipos.Get(DSNCodigo) then begin
                    DSNDescripcion := Equipos.DSNDescripcion;
                    DSNPlaca := Equipos.DSNPlaca;
                    DSNChasis := Equipos.DSNChasis;
                    DSNTipoVehiculo := Equipos.DSNTipoVehiculo;
                    DSNMarca := Equipos.DSNMarca;
                    DSNModelo := Equipos.DSNModelo;
                    DSNFicha := Equipos.DSNFicha;
                end;
            end;
        }
        field(50002; "DSNDescripcion"; text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(50003; "DSNPlaca"; Code[10])
        {
            Caption = 'Plate';
            DataClassification = CustomerContent;
        }
        field(50004; "DSNChasis"; Text[50])
        {
            Caption = 'Chassis';
            DataClassification = CustomerContent;
        }
        field(50005; "DSNTipoVehiculo"; Code[20])
        {
            Caption = 'Type';
            TableRelation = "DSNDatosAuxiliares".DSNCodigo WHERE(DSNTipoRegistro = const("Tipo de Vehiculo"));
            DataClassification = CustomerContent;
        }
        field(50006; "DSNMarca"; Text[20])
        {
            Caption = 'Brand';
            DataClassification = CustomerContent;
        }
        field(50007; "DSNModelo"; Text[20])
        {
            Caption = 'Model';
            DataClassification = CustomerContent;
        }
        field(50008; "DSNFicha"; Code[15])
        {
            Caption = 'Registration';
            DataClassification = CustomerContent;
        }
        field(50009; HoraEnvio; Time)
        {
            Caption = 'Hora envío';
            DataClassification = CustomerContent;
            //NotBlank = true;
        }
        field(50010; TotalComision; Decimal)
        {
            Caption = 'Total comisión';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Invoice Line"."Monto Comision" WHERE("Document No." = field("No.")));
        }
    }

}