CLASS zcl_new_jcp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    data: lv_nombre type string,
          lv_code   type string.

    methods: constructor IMPORTING iv_nombre type string optional
                                   iv_codigo type string optional.

    interfaces if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_new_jcp IMPLEMENTATION.

    method constructor.
      lv_nombre = iv_nombre.
      lv_code   = iv_codigo.
    endmethod.

    method if_oo_adt_classrun~main.

        data(lo_test) = new zcl_new_jcp( iv_nombre = 'juan' iv_codigo = '12345' ).
        out->write( | Nombre = { lo_test->lv_nombre } Código = { lo_test->lv_code } | ).

        data(lr_oo) = ref #( lo_test ).

        out->write( lr_oo->* ).

    endmethod.
ENDCLASS.
