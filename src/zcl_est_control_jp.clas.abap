CLASS zcl_est_control_jp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF lty_emple,
             name  TYPE string,
             id    TYPE string,
             email TYPE /dmo/email_address,
           END OF lty_emple,
           BEGIN OF lty_seccion,
             section TYPE string,
             emple   TYPE lty_emple,
             area    TYPE string,
             zona    TYPE i,
           END OF LTy_seccion.
ENDCLASS.



CLASS ZCL_EST_CONTROL_JP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    types:BEGIN OF lty_empleadm,
            id_code type string.
            include type lty_emple as dd.
    types: end of lty_empleadm.

    types:BEGIN OF lty_empleadm2.
            include type lty_emple as dd.
    types: end of lty_empleadm2.

    DATA: les_emple  TYPE lty_emple,
          les_emple2 LIKE les_emple.
    DATA(les_emple3) = les_emple2.
    data(les_empleadm) = value lty_empleadm(  ).
    data(les_empleadm2) = value lty_empleadm2(  ).
    DATA(les_seccion2) = VALUE lty_seccion(  ).
    DATA(les_emplea) = VALUE lty_seccion( section = 'ventas'
                                           emple = VALUE #( name = 'juan'
                                                            id = '0001'
                                                            email = 'jcpinariva@gmail.com' )
                                           area  = 'Maderas'
                                           zona = 7 ).

    DATA: BEGIN OF les_nested,
                     begin of les_nombre,
                        name     TYPE string,
                        apellido TYPE string,
                     END of les_nombre,

                     begin of les_direccion,
                        calle    TYPE string,
                        nro      TYPE string,
                        comuna   TYPE string,
                      END OF les_direccion,
          END OF les_nested.

    les_nested-les_nombre-name = 'Roberto'.
    les_nested = value #(
                          les_nombre = value #( name = 'Juan' apellido = 'mamerto' )
                          les_direccion = value #( calle = 'tristan matta' nro = '5160' comuna = 'San Miguel' )
                        ).

    les_empleadm-id_code = '0001'.
    les_empleadm-id = '0001'.
    les_empleadm-name    = 'juan'.
    les_empleadm-email   = 'wwww@kkkk'.
     out->write( les_empleadm ).
    les_empleadm = value #( id_code = '0007' id = '999' name = 'carlos' email = 'sss@gmail.com' ).
    les_empleadm2 = value #(  name = 'carlos' id = '999' email = 'sss@gmail.com' ).

***    out->write( les_nested ).
***    les_nested-les_nombre-name = 'Roberto'.
*    out->write( les_empleadm2 ).
*
    data(lv_var) = ' .. cantar no es bueno .. '.
**    REPLACE all OCCURRENCES OF '.' IN lv_var with '*'.
*
**    lv_var = replace( val = lv_var sub = '' with = '&' occ = 0 ).
**    out->write( lv_var ).
*    lv_var = replace( val = lv_var with = '&&&'  off = 3 len = 2 ).
*    out->write( lv_var ).

    if lv_var cp '*CAX*'.
      out->write( 'si contiene' ).
    else.
      out->write( 'NO contiene' ).
    endif.

  ENDMETHOD.
ENDCLASS.
