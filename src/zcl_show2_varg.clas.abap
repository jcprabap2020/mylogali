CLASS zcl_show2_varg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_show2_varg IMPLEMENTATION.

    method if_oo_adt_classrun~main.

        types: lty_cod type RANGE OF string.

        data(ir_cod) = value lty_cod( ( option = 'CP' sign = 'I' low = 'JL' )
                                      ( option = 'EQ' sign = 'I' low = 'SQ' )
                                    ).

        data(lo_show) = new zcl_show_varg( ir_cod ).

        out->write( data = lo_show->gti_flight name = 'tabla' ).

    endmethod.
ENDCLASS.
