CLASS zcl_varios_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_VARIOS_JCPR IMPLEMENTATION.


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
*        data: lv_int type i VALUE 100,
*              lv_ref type REF to i.
*
*        FIELD-SYMBOLS <fs_mio> type any.
*
*        lv_ref = ref #( lv_int ).
*
*        out->write( lv_ref->* ).
*        assign lv_ref->* to <fs_mio>.
*
*        <fs_mio> = 999.
*REF

*        select from /dmo/flight
*        fields *
*        into table new @DATA(lr_flight).
*
*        ASSIGN lr_flight->* to FIELD-SYMBOL(<fs_tabla>).
*
*        LOOP at <fs_tabla> ASSIGNING FIELD-SYMBOL(<fs_linea>).
*            <fs_linea>-currency_code = 'SSS'.
*        endloop.
*
*        out->write( data = lr_flight name = 'tabla' ).
*
*        select single from /dmo/flight
*        fields *
*        into new @DATA(lr_linea).
*
*        out->write( data = lr_linea name = 'linea' ).

*assig
        TYPES: BEGIN OF lty_data,
                campo1 type i,
                campo2 type string,
                campo3 type string,
              end of lty_data.
         DATA: ls_data type lty_data,
               lti_data type table of lty_data WITH EMPTY KEY.

         ls_data = value #( campo1 = 1
                            campo2 = 'juanka'
                            campo3 = 'hola' ).

         append ls_data to lti_data.

         out->write( data = lti_data name = 'lti_data' ).

         data(lr_data) = new lty_data( campo1 = 2 campo2 = 'carlos' campo3 = 'Rivara' ).
*         out->write( data = lr_data name = 'lr_data' ).
         append lr_data->* to lti_data.
*         out->write( data = lti_data name = 'lti_data' ).

         ASSIGN lti_data[ 2 ]-('campo3') to FIELD-SYMBOL(<fs_1>).
         out->write( data = <fs_1> name = '<fs_1>' ).

         ASSIGN ls_data-('campo2') to <fs_1>.
         out->write( data = <fs_1> name = '<fs_1>' ).

         ASSIGN ('ls_data-campo3') to <fs_1>.
         out->write( data = <fs_1> name = '<fs_1*>' ).

         data(lo_class) = new zcl_new_jcp( iv_codigo = '234' iv_nombre = 'viviana' ).
         ASSIGN lo_class to FIELD-SYMBOL(<fs_2>).
         out->write( data = <fs_2>->lv_nombre name = '<fs_2>' ).


    endmethod.
ENDCLASS.
