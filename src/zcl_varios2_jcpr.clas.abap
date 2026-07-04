CLASS zcl_varios2_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_VARIOS2_JCPR IMPLEMENTATION.


    method if_oo_adt_classrun~main.

        DATA lti_stand  type STANDARD TABLE OF /dmo/flight WITH EMPTY KEY.
        DATA lti_sorted type SORTED TABLE OF /dmo/flight WITH NON-UNIQUE key FLIGHT_DATE.
        DATA lti_hash   type SORTED TABLE OF /dmo/flight WITH UNIQUE key carrier_id connection_id FLIGHT_DATE.

        select from /dmo/flight
        fields *
        into table @lti_stand.

        sort lti_stand by carrier_id.

        out->write( data = lti_stand name = 'tabla standart' ).
        "tabla sorted
*        select from /dmo/flight
*        fields *
*        into table @lti_sorted.
*
*        out->write( data = lti_sorted name = 'tabla sorted' ).

*        "tabla hash
*        select from /dmo/flight
*        fields *
*        into table @lti_hash.
*
*        out->write( data = lti_hash name = 'tabla hash' ).
    endmethod.
ENDCLASS.
