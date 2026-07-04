CLASS zcl_llenartab_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LLENARTAB_JCPR IMPLEMENTATION.


    method if_oo_adt_classrun~main.



        TYPES: BEGIN OF les_reg,
                cod type n length 3,
                nombre type string,
              end of les_reg,
              lty_tab_reg type STANDARD TABLE OF les_reg WITH EMPTY KEY,
              lty_tab_reg2 TYPE SORTED TABLE OF /dmo/flight WITH NON-UNIQUE key carrier_id CONNECTION_ID.


        data: lti_employ type lty_tab_reg,
              les_reg    type les_reg,
              lti_employ2 like lti_employ,
              lti_employ_sorted type lty_tab_reg2.



*        data(lti_emplo) = value lty_reg(
*                                         ( cod = 001 nombre = 'juan' )
*                                           ( cod = 002 nombre = 'pepe' )
*                                       ).
*        lti_employ = value #( ( cod = 00  ( cod = 002 nombre = 'silvia' )  1 nombre = 'juan' )
*                                ( cod =   ( cod = 003 nombre = 'papa' )    002 nombre = 'pepe' )
*                                ( cod = 002 nombre = 'silvia' )
*                                ( cod = 003 nombre = 'papa' )
*                             ).
*insertar
*        les_reg-cod = '999'.
*        les_reg-nombre = 'Maria Contreras'.
*        insert les_reg into table lti_employ.
*
*        les_reg-cod = '111'.
*        les_reg-nombre = 'julia contreras'.
*        insert les_reg into table lti_employ.
*
*        insert INITIAL LINE INTO table lti_employ.
*
*        insert value #(  cod = '888' nombre = 'ester maria'
*                         ) into table  lti_employ.
*
*        out->write( data = lti_employ name = 'tabla' ).
*        out->write( |\n\n| ).
*
*        insert lines of lti_employ INTO table lti_employ2.
*        out->write( data = lti_employ2 name = 'lti_employ2' ).
*append
*        les_reg-cod = '999'.
*        les_reg-nombre = 'Maria Contreras'.
*        append les_reg to lti_employ.
**        append initial LINE TO lti_employ.
*        les_reg-cod = '111'.
*        les_reg-nombre = 'julia contreras'.
*        append les_reg to lti_employ.
*
*
*        append value #( cod = '777' nombre = 'Mario soto' ) to lti_employ.
*        out->write( data = lti_employ name = 'tabla' ).
*        append LINES OF lti_employ to lti_employ2.
*        out->write( data = lti_employ2 name = 'tabla2' ).
*corresponding
         select from /dmo/flight
         fields *
         into table @data(lti_flight).

*         out->write( data = lti_flight name = 'lti_flight' ).
*         types: BEGIN OF les_corr,
*                  CARRIER type string,
*                  CONNECTION type string,
*                  FLIGHT_DATE type /dmo/flight_date,
*                END of LES_corr,
*                lty_corr2 type STANDARD TABLE OF LES_corr.
*
*         DATA lti_corr2 type lty_corr2.
*
*         lti_corr2 = CORRESPONDING #( lti_flight MAPPING carrier = carrier_id CONNECTION = CONNECTION_id ).
*
**         lti_corr2 = CORRESPONDING #( base ( lti_corr2 ) lti_flight MAPPING carrier = carrier_id CONNECTION = CONNECTION_id ).
**         out->write( data = lti_corr2 name = 'lti_corr2' ).
*
*         data(les_regi) = value #( lti_corr2[ lines( lti_flight ) ] default lti_corr2[ 1 ] ).
*
*         out->write( data = les_regi name = 'regi' ).
*         data(les_regi2) = value #( lti_corr2[ FLIGHT_DATE = '20260416' ] ).
*         out->write( data = les_regi2 name = 'regi' ).
*
*         lti_employ_sorted = CORRESPONDING #( lti_flight ).
*         out->write( data = lti_employ_sorted name = 'sorted' ).
*
*         data(les_ord) = value #( lti_employ_sorted[ key primary_key carrier_id = 'JL' CONNECTION_ID = '408' ] ).
*         out->write( data = les_ord name = 'les_ord' ).

          data lt_nueva like lti_flight.
*          LOOP AT lti_flight into data(les_fly) GROUP BY les_fly-carrier_id.
*
*            clear lt_nueva.
*            LOOP at GROUP les_fly into data(ls_linea).
*                lt_nueva = value #( base lt_nueva ( ls_linea ) ).
*            endloop.
*            out->write( lt_nueva ).
*          endloop.
*          LOOP AT lti_flight into data(les_fly) GROUP BY ( id = les_fly-carrier_id
*                                                           plane = les_fly-PLANE_TYPE_ID
*                                                           size = GROUP size ) without MEMBERS into data(gs_key).
*
**            clear lt_nueva.
**            LOOP at GROUP gs_key into data(ls_linea).
**                lt_nueva = value #( base lt_nueva ( ls_linea ) ).
**            endloop.
**            out->write( lt_nueva ).
*              out->write( gs_key ).
*          endloop.
      types: lty_carr type STANDARD TABLE OF /dmo/flight-carrier_id WITH EMPTY KEY.

      data(lti_carriers) = value lty_carr( for GROUPS lv_grupo of ls_grupos in lti_flight
                                                  GROUP by ls_grupos-carrier_id
                                                  ASCENDING
                                                  WITHOUT MEMBERS ( lv_grupo  ) ).
                out->write( data = lti_carriers name = 'lti_carriers' ).
    endmethod.

ENDCLASS.
