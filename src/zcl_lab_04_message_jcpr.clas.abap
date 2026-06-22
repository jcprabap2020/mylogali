CLASS zcl_lab_04_message_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_message_jcpr IMPLEMENTATION.
   method if_oo_adt_classrun~main.
     data: LV_ORDER_STATUS type string value 'Purchase Completed Successfully',
           LV_CHAR_NUMBER  TYPE i.

*    1. Símbolos de texto
        out->write( 'Símbolos de texto' ).
        out->write( '---------------------------------' ).
        out->write( text-001 ).

*     2. Funciones de descripción
        out->write( 'Funciones de descripción' ).
        out->write( '---------------------------------' ).
        LV_CHAR_NUMBER = strlen( LV_ORDER_STATUS ).
        out->write( |strlen={ LV_CHAR_NUMBER }| ).
        LV_CHAR_NUMBER = numofchar( LV_ORDER_STATUS ).
        out->write( |numofchar={ LV_CHAR_NUMBER }| ).

        data(lv_num) = count( val = LV_ORDER_STATUS sub = 'A' case = abap_false ).
        out->write( |contar letras A ={ lv_num }| ).

        lv_num = count( val = LV_ORDER_STATUS sub = 'S' case = abap_false ).
        out->write( |contar letras S ={ lv_num }| ).

        LV_CHAR_NUMBER = find( val = LV_ORDER_STATUS sub = 'Comple' case = abap_false ).
        out->write( |Posicion de Comple ={ LV_CHAR_NUMBER }| ).

*        3. Funciones de procesamiento
        out->write( 'Funciones de procesamiento' ).
        out->write( '---------------------------------' ).
        DATA lv_cadena type string.
        lv_cadena = LV_ORDER_STATUS.
        out->write( |Original= { LV_ORDER_STATUS }| ).

        LV_ORDER_STATUS = to_upper( LV_ORDER_STATUS ).
        out->write( |Mayusculas= { LV_ORDER_STATUS }| ).

        LV_ORDER_STATUS = lv_cadena.
        LV_ORDER_STATUS = to_lower( LV_ORDER_STATUS ).
        out->write( |Minúsculas= { LV_ORDER_STATUS }| ).

        LV_ORDER_STATUS = lv_cadena.
        LV_ORDER_STATUS = to_mixed( LV_ORDER_STATUS ).
        out->write( |Mixed= { LV_ORDER_STATUS }| ).

        out->write( '-------------shift---------------' ).
        LV_ORDER_STATUS = lv_cadena.
        LV_ORDER_STATUS = shift_left( val = LV_ORDER_STATUS circular = 9 ).
        out->write( |corre primeros 9 caract al final= { LV_ORDER_STATUS }| ).
        out->write( '-------------substring---------------' ).
        LV_ORDER_STATUS = lv_cadena.
        LV_ORDER_STATUS = substring( val = LV_ORDER_STATUS off = 9 len = 9 ).
        out->write( |Saca la palabra Completed={ LV_ORDER_STATUS }| ).
        out->write( '-------------substring----usando find-----------' ).
        LV_ORDER_STATUS = lv_cadena.
        LV_ORDER_STATUS = substring( val = LV_ORDER_STATUS off = find( val = LV_ORDER_STATUS sub = 'Completed' ) len = 9 ).
        out->write( |Saca la palabra Completed={ LV_ORDER_STATUS }| ).
        out->write( '-------------reverse-----------' ).
        LV_ORDER_STATUS = lv_cadena.
        LV_ORDER_STATUS = reverse( val = LV_ORDER_STATUS  ).
        out->write( |Reversar la cadena={ LV_ORDER_STATUS }| ).

*        4. Funciones de contenido
        out->write( 'Funciones de contenido' ).
        out->write( '---------patron 1------------------------' ).
        data: LV_PATTERN type string value '\d{3}-\d{3}-\d{4}',
              LV_PHONE   type string value '300-524-2542'.

        if contains( val = LV_PHONE pcre = LV_PATTERN ).
            out->write( 'Es un telefono' ).
        else.
            out->write( 'NO es un telefono' ).
        endif.

        out->write( '------------patron 2---------------------' ).
        LV_PATTERN = '\d{10}'.
        LV_PHONE   = '3005-242542'.
        if contains( val = LV_PHONE pcre = LV_PATTERN ).
            out->write( 'Es un telefono' ).
        else.
            out->write( 'NO es un telefono' ).
        endif.


*       5. Funciones con expresiones regulares
        out->write( '-----------------------------------------------' ).
        out->write( 'Funciones con expresiones regulares' ).
        out->write( '---------reconoce email------------------------' ).
        DATA: lv_email  type string VALUE 'jcpinarivara@gmail.co',
              lv_patter type string VALUE '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'.

        if contains( val = lv_email pcre = LV_PATTER ).
            out->write( 'Es un correo' ).
        else.
            out->write( 'NO es un correo' ).
        endif.


   endmethod.
ENDCLASS.
