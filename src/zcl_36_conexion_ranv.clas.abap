CLASS zcl_36_conexion_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: hour        TYPE zsyst_uzeit,
          sender_user TYPE string..

    METHODS on_time_out FOR EVENT time_out OF zcl_35_timer_ranv
      IMPORTING ev_hour
                sender.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_36_CONEXION_RANV IMPLEMENTATION.


  METHOD on_time_out.
    me->hour = ev_hour.
    me->sender_user = sender->user.
  ENDMETHOD.
ENDCLASS.
