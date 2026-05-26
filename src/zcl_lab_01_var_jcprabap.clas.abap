CLASS zcl_lab_01_var_jcprabap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_var_jcprabap IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "1. Tipo de datos elementales

    DATA: mv_purchase_date TYPE d,
          mv_purchase_time TYPE t.

    DATA: mv_price TYPE f VALUE '10.6',
          mv_tax   TYPE i VALUE 16.

    DATA: mv_increase  TYPE decfloat16 VALUE '20.5',
          mv_discounts TYPE decfloat34 VALUE '10.5'.

    DATA: mv_type      TYPE c LENGTH 10 VALUE '10',
          mv_type2(10) TYPE c VALUE '20',
          mv_shipping  TYPE p DECIMALS 2 VALUE '40.36'.

    DATA: mv_id_code TYPE n LENGTH 4 VALUE '1110',
          mv_qr_code TYPE x LENGTH 5 VALUE 'F5CF'.

    mv_purchase_date = xco_cp=>sy->date( )->as( xco_cp_time=>format->abap )->value.
    mv_purchase_time = xco_cp=>sy->time( )->as( xco_cp_time=>format->abap )->value.

    "2. Tipo de datos complejos

    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF mty_customer.

    DATA les_customer TYPE mty_customer.

    les_customer = VALUE #( id = 1 customer = 'Luis Marcel' age = 65 ).

*    out->write( les_customer  ).
*    out->write( |id={ les_customer-id } cliente={ les_customer-customer } Edad={ les_customer-age }| ).

    "3. Tipo de datos de referencia

    DATA mv_employees TYPE REF TO /dmo/employee_hr.
    FIELD-SYMBOLS: <fs_linea> TYPE /dmo/employee_hr.

    CREATE DATA mv_employees TYPE /dmo/employee_hr.
    ASSIGN mv_employees->* TO <fs_linea>.

    <fs_linea>-client = 111.
    <fs_linea>-employee = 1.
    <fs_linea>-first_name = 'Marcelo'.
    <fs_linea>-last_name = 'Buitrago'.
    <fs_linea>-manager = '0001'.
    <fs_linea>-salary = 2000.
    <fs_linea>-salary_currency = 'USD'.

    out->write( mv_employees ).

    "4. Objetos de datos

    DATA: mv_product  TYPE string  VALUE 'Laptop',
          mv_bar_code TYPE xstring VALUE '1212121211'.

    "5. Constantes
    CONSTANTS: mc_date      type d value '20260524',
               mc_time      type t value '094500',
               mc_price     type f value '10.6',
               mc_tax       type i value '16',
               mc_increase  TYPE decfloat16 VALUE '20.5',
               mc_discounts TYPE decfloat34 VALUE '10.5',
               mc_type      TYPE c LENGTH 10 VALUE '10',
               mc_shipping  TYPE p DECIMALS 2 VALUE '40.36',
               mc_id_code   TYPE n LENGTH 4 VALUE '1110',
               mc_qr_code   TYPE x LENGTH 5 VALUE 'F5CF',
               mc_product  TYPE string  VALUE 'Laptop',
               mc_bar_code TYPE xstring VALUE '1212121211'.

    MV_PURCHASE_DATE = mc_date.
    MV_PURCHASE_TIME = mc_time.
    mv_price         = mc_price.
    mv_tax           = mc_tax.
    mv_increase      = mc_increase.
    mv_discounts     = mc_discounts.
    mv_type          = mc_type.
    mv_shipping      = mc_shipping.
    mv_id_code       = mc_id_code.
    mv_qr_code       = mc_qr_code.
    mv_product       = mc_product.
    mv_bar_code      = mc_bar_code.

    "6. Declaraciones en Línea

    data(LV_PRODUCT) = `Laptop`.
    data(lv_bar_code) = xco_cp=>string( '1212121211' )->as_xstring( xco_cp_character=>code_page->utf_8 )->value.


  ENDMETHOD.

ENDCLASS.
