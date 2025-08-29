program ArbolID;

type
  PNodoLista = ^TNodoLista;
  TNodoLista = record
    Nombre: string;
    Apellido: string;
    sig: PNodoLista;
  end;

  PArbol = ^TNodoArbol;
  TNodoArbol = record
    dato: TNodoLista;
    ID: integer;
    Lista: PNodoLista;
    Izq,Der: PArbol;
  end;

// Lista

procedure InsertarEnLista(var L: PNodoLista; Nombre, Apellido: string);
var
  Nuevo, Aux: PNodoLista;
begin
  New(Nuevo);
  Nuevo^.Nombre := Nombre;
  Nuevo^.Apellido := Apellido;
  Nuevo^.sig := nil;

  if L = nil then
    L := Nuevo
  else
  begin
    Aux := L;
    while Aux^.sig <> nil do
      Aux := Aux^.sig;
    Aux^.sig := Nuevo;
  end;
end;

procedure MostrarLista(L: PNodoLista);
begin
  while L <> nil do
  begin
    Writeln('Nombre: ', L^.Nombre, ', Apellido: ', L^.Apellido);
    L := L^.Sig;
  end;
end;

// Arbol

procedure InsertarEnArbol(var A: PArbol; ID: integer; Nombre, Apellido: string);
begin
  if A = nil then 
  begin
    New(A);
    A^.ID := ID;
    A^.Lista := nil;
    A^.Izq := nil;
    A^.Der := nil;
    InsertarEnLista(A^.Lista, Nombre, Apellido);
  end
  else if ID < A^.ID then
    InsertarEnArbol(A^.Izq, ID, Nombre, Apellido)
  else if ID = A^.ID then
    InsertarEnLista(A^.Lista, Nombre, Apellido)
  else
    InsertarEnArbol(A^.Der, ID, Nombre, Apellido);
end;

procedure InOrden(Nodo: PArbol);
begin
  if Nodo <> nil then
  begin
    InOrden(Nodo^.Izq);
    WriteLn('ID: ', Nodo^.ID, '->');
    MostrarLista(Nodo^.Lista);
    InOrden(Nodo^.Der);
  end;
end;

// Main

var
  Arbol: PArbol;
begin
  Arbol := nil;
  InsertarEnArbol(Arbol, 3, 'Juan', 'Perez');  //<--
  InsertarEnArbol(Arbol, 1, 'Ana', 'Gomez');    // |
  InsertarEnArbol(Arbol, 2, 'Luis', 'Martinez'); // |
  InsertarEnArbol(Arbol, 3, 'Maria', 'Lopez'); // Mismo ID 

  WriteLn('Recorrido en InOrden del árbol:');
  InOrden(Arbol);

  ReadLn;
end.
