CLASS zcl_fsymbols_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fsymbols_jcpr IMPLEMENTATION.

    method if_oo_adt_classrun~main.
*        DATA lv_nombre type string VALUE 'Ernesto'.
*        FIELD-SYMBOLS <fs_test> type string.
*
*        assign lv_nombre to <fs_test>.
*
*        out->write( <fs_test> ).
*
*        <fs_test> = 'LULA'.
*
**        unassign <fs_test>.
*        out->write( <fs_test> ).

      delete from zdbt_profesores.
      select from zdbt_profesores
      fields *
      into table @DATA(lti_profe).

      append INITIAL LINE TO lti_profe ASSIGNING FIELD-SYMBOL(<fs_reg>).

      <fs_reg> = value #( client = sy-mandt codigo = 1 nombre = 'Juan' ).
      append INITIAL LINE TO lti_profe ASSIGNING <fs_reg>.
      <fs_reg> = value #( client = sy-mandt codigo = 2 nombre = 'pepe' ).
      append INITIAL LINE TO lti_profe ASSIGNING <fs_reg>.
      <fs_reg> = value #( client = sy-mandt codigo = 3 nombre = 'Silvia' ).
      insert INITIAL LINE inTO lti_profe ASSIGNING <fs_reg> index 4.
      <fs_reg> = value #( client = sy-mandt codigo = 9 nombre = 'Jose' ).
      out->write( lti_profe ).

      insert zdbt_profesores from table @lti_profe.

      UNASSIGN <fs_reg>.

      ASSIGN lti_profe to FIELD-SYMBOL(<fs_tab>).

      <fs_tab>[ 3 ]-nombre = 'viviana'.
      out->write( lti_profe ).

    endmethod.
ENDCLASS.
