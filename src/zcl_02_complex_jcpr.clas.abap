CLASS zcl_02_complex_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_complex_jcpr IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES:BEGIN OF lty_empleado,
            id(4)    TYPE c,
            name(18) TYPE c,
            edad     TYPE i,
          END OF lty_empleado,

          BEGIN OF ENUM lty_estados,
            on,
            off,
            nose,
          END OF ENUM lty_estados.

    DATA: les_emple  TYPE lty_empleado,
          les_admin  LIKE les_emple,
          les_status TYPE lty_estados,
          ls_cadena  TYPE string.


    les_emple = VALUE #( id = '1000'
                         name = 'juanka'
                         edad = 25 ).

    les_admin = VALUE #( id = '2000'
                         name = 'pepe'
                         edad = 24 ).

    out->write( |id: { les_emple-id } nombre : { les_emple-name } edad: { les_emple-edad }| ).

    ls_cadena = |id: { les_admin-id } nombre : { les_admin-name } age: { les_admin-edad }|.

    out->write( ls_cadena ).

    clear ls_cadena.
    CONCATENATE les_admin-id les_admin-name INTO ls_cadena SEPARATED BY space.

    out->write( ls_cadena ).

    les_status = off.
    out->write( |estatus: { les_status }| ).

  ENDMETHOD.
ENDCLASS.
