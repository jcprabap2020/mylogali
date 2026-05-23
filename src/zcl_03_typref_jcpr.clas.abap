CLASS zcl_03_typref_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_typref_jcpr IMPLEMENTATION.

    method if_oo_adt_classrun~main.
        out->write( 'Hola mi amigo como estas' ).
    endmethod.
ENDCLASS.
