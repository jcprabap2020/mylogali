CLASS zcl_01_tipos_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_tipos_jcpr IMPLEMENTATION.

    method if_oo_adt_classrun~main.
        data(lv_string) = 'Cadena'. "define una cadena"
        data: lv_int type i VALUE 3555,
              lv_date1 type d.

        lv_date1 = '20260330'.

        out->write( lv_string ).
        out->write( lv_int ).
        out->write( lv_date1 ).

    endmethod.
ENDCLASS.
