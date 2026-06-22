CLASS zcl_tablas1_jcp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas1_jcp IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF lty_linea,
             id type i,
             nombre TYPE string,
           END OF LTY_linea.
    DATA lti_datos TYPE STANDARD TABLE OF lty_linea.

    DATA: lti_index TYPE TABLE OF /dmo/flight WITH EMPTY KEY,
          lti_ind   TYPE SORTED TABLE OF /dmo/flight WITH NON-UNIQUE KEY flight_date,
          lti_ind2  LIKE lti_ind.

*    SELECT *
*    FROM /dmo/flight
*    WHERE carrier_id = 'SQ'
*    INTO TABLE @lti_index.

*    "lti_ind[] = lti_index[].
**    MOVE-CORRESPONDING lti_index to lti_ind.
***    MOVE-CORRESPONDING lti_index to lti_ind KEEPING TARGET LINES.
**    lti_ind2 = CORRESPONDING #( base ( lti_ind ) lti_index  ).
*     lti_ind2 = CORRESPONDING #( lti_index ).
*     insert LINES OF lti_index inTO table lti_ind2.

*    out->write( data = lti_index name = 'datos en tabla' ).
*    data(lv_tot) = lines( lti_index  ).
*    IF lv_tot > 0.
*      out->write( | 'nro de regs = ' { lv_tot  } | ).
*      IF line_exists( lti_index[ connection_id = '0002' ] ).
*        DATA(lv_pos) = line_index( lti_index[ connection_id = '0002' ] ).
*        out->write( | 'si existe posicion= ' { lv_pos }| ).
*      ELSE.
*        out->write( ' NO si existe' ).
*      ENDIF.
*    ELSE.
*
*    ENDIF.

*     lti_datos = value #( FOR i = 0 while i <= 10
*                             (
*                              id = i + 20
*                              nombre = |user{ i }|
*                               )
*                               ).

*    select from /dmo/flight
*    fields *
*    into table @DATA(lti_flight).
*
*    data lt_member LIKE lti_flight.

*    out->write( data = lti_flight ).

*    LOOP at lti_flight into data(les_fly) GROUP BY ( plane = les_fly-plane_type_id
*                                                     carry = les_fly-carrier_id ).
*
**        clear lt_member.
**        LOOP at group les_fly into data(les_member).
**            lt_member = value #( base lt_member ( les_member )  ).
**        endloop.
**        out->write( data = lt_member name = 'grupo'  ).
*
*    endloop.

*    LOOP at lti_flight into data(les_fly) GROUP BY ( plane = les_fly-plane_type_id
*                                                     carry = les_fly-carrier_id
*                                                     index = GROUP INDEX
*                                                     size  = GROUP size
*
*                                                     ) WITHOUT MEMBERS into data(ls_key).
*
*
*         out->write( data = ls_key name = 'clave'  ).
**        out->write( data = lt_member name = 'grupo'  ).
*
*    endloop.
     types: lty_tipo TYPE STANDARD TABLE OF /dmo/flight-carrier_id WITH EMPTY KEY.

*     out->write( value lty_tipo( for groups gv_group of gs_group in lti_flight
*                            GROUP by gs_group-carrier_id
*                            DESCENDING
*                            WITHOUT MEMBERS ( gv_group )
*                        ) ).

    select from /dmo/flight
    fields *
    into table @DATA(lti_flight).

     data(lti_tipos) = value lty_tipo( for groups gv_group of gs_group in lti_flight
                            GROUP by gs_group-carrier_id
                            ASCENDING
                            WITHOUT MEMBERS ( gv_group )
                        ).

     types: lty_ran type range of /dmo/flight-carrier_id.

*     LOOP at lti_tipos into data(les_dat) from 2 to 5.
         data(lti_range) = value lty_ran(  for les_dat in lti_tipos
                                            (   sign = 'I'
                                              option = 'EQ'
                                              low = les_dat )
                                         ).
*     endloop.

    select from /dmo/flight
        fields *
        where carrier_id in @lti_range
        order by  carrier_id
        into table @DATA(lti_flight2).

     out->write( data = lti_flight2 ).
   endmethod.
ENDCLASS.
