CLASS zcl_cadenas_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cadenas_jcpr IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lv_cadena TYPE string VALUE 'LOGALY GROUP Quiero Expresar'.
*         out->write( lv_cadena ).
**        lv_cadena = to_upper( lv_cadena ).
**        out->write( lv_cadena ).
**        lv_cadena = to_lower( lv_cadena ).
**        out->write( lv_cadena ).
**        lv_cadena = to_mixed( lv_cadena ).
**        out->write( lv_cadena ).
*        lv_cadena = from_mixed( lv_cadena ).
*        out->write( lv_cadena ).

*    lv_cadena = substring( val = lv_cadena off = 5  ).
*    out->write( lv_cadena ).
*    lv_cadena = substring_from( val = lv_cadena sub = 'GROUP'  ).
*    out->write( lv_cadena ).
*    lv_cadena = substring_after( val = lv_cadena sub = 'GROUP'  ).
*    out->write( lv_cadena ).
*    lv_cadena = 'LOGALY GROUP Quiero Expresar'.
*    lv_cadena = substring_to( val = lv_cadena sub = 'GROUP'  ) .
*    out->write( lv_cadena ).
*    lv_cadena = repeat( val = substring_before( val = lv_cadena sub = 'GROUP'  ) occ = 5 ).
*    out->write( lv_cadena ).

*     lv_cadena = 'HOLA '.
*     data(lv_regex) = '\w4'.
*     data(lv_pos) = count( val = lv_cadena pcre = lv_regex  ).
*     out->write( lv_pos ).

*      lv_cadena = ` HOA  `.
**     lv_cadena = ' HOA      '.
*     data(lv_tot) = strlen( lv_cadena ).
*     out->write( lv_tot ).

    data(lv_text) = 'La historia le da la razon en el año 19-45'.
    if contains( val = lv_text pcre = '\d{4}-\d{1}' ).
       out->write( 'Si' ).

    else.
       out->write( 'NO' ).
    endif.


ENDMETHOD.
ENDCLASS.
