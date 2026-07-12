CLASS zcl_crea_struc_dinam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crea_struc_dinam IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lo_struct_type TYPE REF TO cl_abap_structdescr,
      lo_table_type  TYPE REF TO cl_abap_tabledescr,
      lt_components  TYPE abap_component_tab,
      ls_component   LIKE LINE OF lt_components,
      lo_data        TYPE REF TO data,
      lo_line        TYPE REF TO data.

FIELD-SYMBOLS: <fs_table> TYPE STANDARD TABLE,
               <fs_line>  TYPE any,
               <fs_field> TYPE any.

* 1. Definir los nombres y tipos de las columnas dinámicamente
ls_component-name = 'ID_EMPLEADO'.
ls_component-type = cl_abap_elemdescr=>get_c( p_length = 10 ).
APPEND ls_component TO lt_components.

ls_component-name = 'NOMBRE_COMPLETO'.
ls_component-type = cl_abap_elemdescr=>get_c( p_length = 50 ).
APPEND ls_component TO lt_components.

* 2. Crear la estructura dinámica con los componentes definidos
lo_struct_type = cl_abap_structdescr=>create( p_components = lt_components ).

* 3. Crear el tipo de tabla interna basándonos en la estructura
lo_table_type  = cl_abap_tabledescr=>create( p_line_type  = lo_struct_type ).

* 4. Instanciar los datos dinámicos en memoria
CREATE DATA lo_data TYPE HANDLE lo_table_type.
ASSIGN lo_data->* TO <fs_table>.

* 5. Crear una línea/work area dinámica para insertar datos
CREATE DATA lo_line TYPE HANDLE lo_struct_type.
ASSIGN lo_line->* TO <fs_line>.

* 6. Ejemplo de asignación de datos a la nueva línea
ASSIGN COMPONENT 'ID_EMPLEADO' OF STRUCTURE <fs_line> TO <fs_field>.
<fs_field> = 'EMP001'.

ASSIGN COMPONENT 'NOMBRE_COMPLETO' OF STRUCTURE <fs_line> TO <fs_field>.
<fs_field> = 'Carlos Mendoza'.

APPEND <fs_line> TO <fs_table>.

out->write( <fs_table> ).
  ENDMETHOD.

ENDCLASS.
