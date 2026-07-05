CLASS zcl_show_varg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    types: gty_cod type RANGE OF string.
    DATA: gr_codigo type gty_cod,
          gti_flight TYPE STANDARD TABLE OF /dmo/flight WITH EMPTY KEY.

    methods: constructor importing ir_cod type gty_cod.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_show_varg IMPLEMENTATION.

    method constructor.
        gr_codigo = ir_cod.
        select from /dmo/flight
        fields *
        where carrier_id in @gr_codigo
        ORDER by carrier_id
        into table @gti_flight.

    endmethod.


ENDCLASS.
