CLASS zcl_varios_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_varios_jcpr IMPLEMENTATION.

    method if_oo_adt_classrun~main.
*       types: lty_decimal type p length 5 decimals 2.
*       data: lv_p type lty_decimal,
*             lv_str type string VALUE '123,37'.
*
*        try.
*            lv_p = exact lty_decimal( lv_str ) .
*            out->write( | 'bien' { lv_p }  | ).
*        catch cx_sy_conversion_error into data(lx_error).
*            out->write( data = lx_error->get_longtext(  ) name = 'Error' ).
*        endtry.




    endmethod.

ENDCLASS.
