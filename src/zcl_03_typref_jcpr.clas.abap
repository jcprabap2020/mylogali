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

  METHOD if_oo_adt_classrun~main.
    Types: lty_tip_int TYPE REF to i.
    DATA: lvr_int      TYPE REF TO i,
          lvr_string   TYPE REF TO string,
          lvr_ddic_tab TYPE REF TO /dmo/airport,
          lvr_int_3    type lty_tip_int,
          ltr_tab      TYPE STANDARD TABLE OF ref to /dmo/airport.

    DATA lo_ref type REF TO zcl_01_tipos_jcpr.



    out->write( 'Hola mi amigo como estas' ).
  ENDMETHOD.
ENDCLASS.
