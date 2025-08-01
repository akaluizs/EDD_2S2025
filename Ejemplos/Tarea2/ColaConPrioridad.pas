
Program ColaConPrioridad;

{$mode objfpc}{$H+}

Type 
  PNodo = ^TNodo;
  TNodo = Record
    dato: integer;
    prioridad: integer;
    sig: PNodo;
    ant: PNodo;
  End;

Var 
  frente, fin: PNodo;

Procedure InicializarCola;
Begin
  frente := Nil;
  fin := Nil;
End;

Procedure Encolar(valor, prioridad: integer);

Var 
  nuevo, actual: PNodo;
Begin
  New(nuevo);
  nuevo^.dato := valor;
  nuevo^.prioridad := prioridad;
  nuevo^.sig := Nil;
  nuevo^.ant := Nil;

  If frente = Nil Then
    Begin
      frente := nuevo;
      fin := nuevo;
    End
  Else
    Begin
      actual := frente;
      While (actual <> Nil) And (actual^.prioridad < prioridad) Do
        actual := actual^.sig;

      If actual = Nil Then
        Begin
          // Insertar al final
          nuevo^.ant := fin;
          fin^.sig := nuevo;
          fin := nuevo;
        End
      Else If actual = frente Then
             Begin
               // Insertar al principio
               nuevo^.sig := frente;
               frente^.ant := nuevo;
               frente := nuevo;
             End
      Else
        Begin
          // Insertar en medio
          nuevo^.sig := actual;
          nuevo^.ant := actual^.ant;
          actual^.ant^.sig := nuevo;
          actual^.ant := nuevo;
        End;
    End;
End;

Procedure MostrarCola;

Var 
  temp: PNodo;
Begin
  temp := frente;
  While temp <> Nil Do
    Begin
      WriteLn('Dato: ', temp^.dato, '| Prioridad: ', temp^.prioridad);
      temp := temp^.sig;
    End;
End;

Procedure LiberarCola;

Var 
  temp: PNodo;
Begin
  While frente <> Nil Do
    Begin
      temp := frente;
      frente := frente^.sig;
      Dispose(temp);
    End;
  fin := Nil;
End;

Begin
  InicializarCola;
  Encolar(10, 2);
  Encolar(20, 1);
  Encolar(30, 3);
  Encolar(40, 1);
  Encolar(50, 2);

  WriteLn('Contenido de la cola:');
  MostrarCola;

  LiberarCola;
  WriteLn('Cola liberada.');
End.
