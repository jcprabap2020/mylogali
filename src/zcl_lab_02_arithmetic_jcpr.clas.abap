CLASS zcl_lab_02_arithmetic_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_arithmetic_jcpr IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lv_base_rate            TYPE i VALUE 20,
          lv_corp_area_rate       TYPE i VALUE 10,
          lv_medical_service_rate TYPE i VALUE 15,
          lv_total_rate           TYPE i.


*1. Suma / Sentencia ADD
    lv_medical_service_rate = lv_medical_service_rate + lv_base_rate +
                              lv_corp_area_rate.

    out->write( 'SUMA' ).
    out->write( lv_medical_service_rate ).
    ADD 5 TO lv_medical_service_rate.
    out->write( lv_medical_service_rate ).
    out->write( '------------------------' ).

*2. Resta / Sentencia SUBTRACT
    DATA: lv_maintenance_rate TYPE i VALUE 30,
          lv_margin_rate      TYPE i VALUE 10.

    lv_base_rate = lv_maintenance_rate - lv_margin_rate.
    out->write( 'RESTA' ).
    out->write( lv_base_rate ).
    SUBTRACT 4 FROM lv_base_rate.
    out->write( lv_base_rate ).
    out->write( '------------------------' ).

*3. Multiplicación / Sentencia MULTIPLY
    DATA: lv_package_weight TYPE i VALUE 2,
          lv_cost_per_kg    TYPE i VALUE 3,
          lv_multi_rate     TYPE i.

    lv_multi_rate = lv_package_weight * lv_cost_per_kg.
    out->write( 'Multiplicación' ).
    out->write( lv_multi_rate ).
    MULTIPLY lv_multi_rate BY 2.
    out->write( lv_multi_rate ).
    out->write( '------------------------' ).

*4. División / Sentencia DIVIDE
    DATA: lv_total_weight TYPE i VALUE 38,
          lv_num_packages TYPE i VALUE 4,
          lv_applied_rate TYPE p LENGTH 8 DECIMALS 2.

    lv_applied_rate = lv_total_weight / lv_num_packages.
    out->write( 'División' ).
    out->write( lv_applied_rate ).
    DIVIDE lv_applied_rate BY 3.
    out->write( lv_applied_rate ).
    out->write( '------------------------' ).

*5. División sin resto / Sentencia DIV
    DATA: lv_total_cost         TYPE i VALUE 17,
          lv_discount_threshold TYPE i VALUE 4,
          lv_result             TYPE p LENGTH 4 DECIMALS 2.

    lv_result = lv_total_cost DIV lv_discount_threshold.
    out->write( 'División sin resto DIV'(005) ).
    out->write( lv_result ).
    out->write( '------------------------' ).

*6. Resto (residuo) de división / Sentencia MOD
    DATA: lv_total_cost2         TYPE i VALUE 19,
          lv_discount_threshold2 TYPE i VALUE 4,
          lv_remainder           TYPE p LENGTH 4 DECIMALS 2.

    lv_remainder = lv_total_cost2 MOD lv_discount_threshold2.
    out->write( text-004 ).
    out->write( lv_remainder ).
    out->write( '------------------------' ).

*7. Exponenciación
    DATA: lv_weight TYPE i VALUE 5,
          lv_expo   TYPE i.

    lv_expo = lv_weight ** 2.
    out->write( 'Exponenciación'(002) ).
    out->write( lv_expo ).
    lv_expo = ipow( base = lv_weight exp = 2 ).
    out->write( 'Exponenciación 2 con Ipow'(003) ).
    out->write( lv_expo ).
    out->write( '------------------------' ).

*8. Raíz cuadrada
    DATA:
          lv_square_root   TYPE i.

    lv_square_root = sqrt( lv_expo ).
    out->write( text-001 ).
    out->write( lv_square_root ).
  ENDMETHOD.
ENDCLASS.
