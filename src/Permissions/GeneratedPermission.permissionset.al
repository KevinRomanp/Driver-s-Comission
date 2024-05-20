permissionset 50000 GeneratedPermission
{
    Assignable = true;
    Permissions = tabledata "Config. Comision Combustibles" = RIMD,

        tabledata DSNDatosAuxiliares = RIMD,
        tabledata DSNEquipos = RIMD,
        tabledata "Hist. Comisiones Combustibles" = RIMD,
        table "Config. Comision Combustibles" = X,
        table DSNDatosAuxiliares = X,
        table DSNEquipos = X,
        table "Hist. Comisiones Combustibles" = X,
        codeunit CalculoComisionesCombustibles = X,
        page "Config. Comisiones Combustible" = X,
        page DSNDatosAuxiliaresPage = X,
        page DSNEquipoPage = X,
        page DSNMarcaPage = X,
        page DSNTipoDeVehiculoPage = X,
        page "Hist. Comisiones Combustibles" = X,
        page "Page Signature" = X;
}