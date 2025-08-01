program OrdenamientoBurbuja;

{$mode objfpc}


uses 
   sysutils;


var
   areglo: array of Integer;


procedure OrdenarBurbuja(var datos: array of Integer);
var
    i,j, temp: Integer;
    intercambio: Boolean;
begin
    for i := High(datos) downto Low(datos) do
    begin
        intercambio := False;
        for j := Low(datos) to i - 1 do
        begin
            if datos[j] > datos[j + 1] then
            begin
                temp := datos[j];
                datos[j] := datos[j + 1];
                datos[j + 1] := temp;
                intercambio := True;
            end;
        end;

        if not intercambio then
            Exit; // Si no hubo intercambio, el arreglo ya está ordenado
    end;
end;

procedure MostrarArreglo(const datos: array of Integer);
var
    i: Integer;
begin
    for i := Low(datos) to High(datos) do
    Write(datos[i], ' ');
    Writeln; // Agrega un salto de línea al final
end;

begin
    SetLength(areglo, 7);
    areglo[0] := 64;
    areglo[1] := 34;
    areglo[2] := 25;
    areglo[3] := 12;
    areglo[4] := 22;
    areglo[5] := 11;
    areglo[6] := 90;

    Writeln('Arreglo original:');
    MostrarArreglo(areglo);

    OrdenarBurbuja(areglo);
    Writeln(#13#10'Arreglo ordenado:');
    MostrarArreglo(areglo);

    Readln;
end.

