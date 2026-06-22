CLASS zcl_lab_05_invoice_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_invoice_jcpr IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    1. Concatenación
    out->write( '---------------------------------' ).
    out->write( 'Concatenación' ).
    out->write( '---------------------------------' ).
    DATA: mv_exercise(4)  TYPE n VALUE '435',
          mv_invoice_no   TYPE n LENGTH 8 VALUE '147',
          mv_invoice_code TYPE string.

    mv_invoice_code = mv_exercise && '/' && mv_invoice_no.
    out->write( mv_invoice_code ).

*    2. Concatenaciones líneas de Tablas
    out->write( '---------------------------------' ).
    out->write( 'Concatenaciones líneas de Tablas' ).
    out->write( '---------------------------------' ).
    SELECT descripcion
    FROM ztb_catego_jcpr
    INTO TABLE @DATA(lti_catego).

      DATA(lv_uni_catego) = concat_lines_of( table = lti_catego sep = '/'  ).
      out->write( lv_uni_catego ).


      DATA: mv_case1  TYPE string,
            mv_case2  TYPE string,
            lv_cadena TYPE string.

      mv_case1 = '  Sales invoice with        status in process   '.
      lv_cadena = mv_case1 .
      mv_case2 = '***ABAP*Cloud***'.

      "dejar 1 solo blanco con condense - primera forma
      CONDENSE mv_case1.
      out->write( mv_case1 ).
      mv_case1 = lv_cadena.
      mv_case1 = condense( val = mv_case1 from = ' ' ).
      out->write( mv_case1 ).

      mv_case1 = lv_cadena.
      mv_case1 = condense( val = mv_case1 to = ' ' ).
      out->write( mv_case1 ).

      mv_case1 = lv_cadena.
      mv_case1 = condense( mv_case1 ).
      out->write( mv_case1 ).

      mv_case2 = condense( condense( val = mv_case2 from = '*' ) ).
      out->write( mv_case2 ).

*      4. SPLIT
        out->write( '---------------------------------' ).
        out->write( 'SPLIT' ).
        out->write( '---------------------------------' ).
        data: MV_DATA type string VALUE '0001111111;LOGALI GROUP;2024'.
        split MV_DATA at ';' into data(MV_ID_CUSTOMER)
                                  data(MV_CUSTOMER)
                                  data(MV_YEAR).
        out->write( MV_ID_CUSTOMER ).
        out->write( MV_CUSTOMER ).
        out->write( MV_YEAR ).

*      5. SHIFT
        data MV_INVOICE_NUM type c LENGTH 8 value '2015ABCD'.
        shift MV_INVOICE_NUM by 2 places.
        out->write( MV_INVOICE_NUM ).
        MV_INVOICE_NUM = '2015ABCD'.
        shift MV_INVOICE_NUM right by 2 places .
        out->write( MV_INVOICE_NUM ).








*    data:lv_string type string VALUE '--ABCD123---'.
*    shift lv_string LEFT DELETING LEADING '-'.
*    out->write( lv_string ).
    ENDMETHOD.
ENDCLASS.
