CLASS zcl_lab_03_datatypes_jcpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_datatypes_jcpr IMPLEMENTATION.
    method if_oo_adt_classrun~main.

*    1. Conversiones de Tipo
        data: MV_CHAR  type c length 10 value '12345',
              MV_NUM   type i,
              MV_FLOAT type f,
              MV_TRUNC type i,
              MV_ROUND type i.

        mv_num   = MV_CHAR.
        out->write( | Entero: { mv_num  } | ).
        mv_float = MV_CHAR.
        out->write(  mv_float ).

        mv_float = '123.45'.
        MV_TRUNC = mv_float.

        out->write(  mv_float ).
        out->write(  MV_TRUNC ).

*      2. Truncamiento y Redondeo
         out->write( '2. Truncamiento y Redondeo' ).
         mv_round = mv_float + '0.5'.
         out->write(  mv_round ).
*      3. Tipos en declaraciones en línea
         out->write( '3. Tipos en declaraciones en línea' ).
         data(lv_string) = 'ABAP'.
         out->write(  lv_string ).

*       4. Conversiones del Tipo Forzado
         out->write( '4. Conversiones del Tipo Forzado' ).
         mv_num = conv i( MV_CHAR ).
         out->write(  mv_num ).

*         5. Cálculo de Fecha y Hora
         out->write( '5. Cálculo de Fecha y Hora' ).
         data:  mv_date1 type d VALUE '20260501',
                mv_date2 type d value '20260515',
                mv_days  type i,
                mv_time  type t.

         mv_days = mv_date2 - mv_date1.
         out->write(  mv_days ).
         "Manipula la cadena y muestra la fecha DDMMYYYY
         out->write( |{ mv_date1+6(2) }{ mv_date1+4(2) }{ mv_date1+0(4) }| ).

*         6. Campos Timestamp
         out->write( '6. Campos Timestamp' ).
         DATA mv_timestamp type utclong.

         mv_timestamp = utclong_current(  ).
         out->write(  mv_timestamp ).

         CONVERT utclong mv_timestamp
           TIME ZONE cl_abap_context_info=>get_user_time_zone( )
           into  date mv_date2 time mv_time.

         out->write(  mv_date2 ).
         out->write(  mv_time ).
    endmethod.
ENDCLASS.
