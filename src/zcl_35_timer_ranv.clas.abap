CLASS zcl_35_timer_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA user TYPE string.

    EVENTS time_out EXPORTING VALUE(ev_hour) TYPE zsyst_uzeit.

    METHODS: constructor,
             increment_counter IMPORTING iv_counter TYPE i,
             check_limit.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA counter TYPE i.

ENDCLASS.



CLASS ZCL_35_TIMER_RANV IMPLEMENTATION.


  METHOD check_limit.

    IF me->counter GE 5.
      RAISE EVENT time_out EXPORTING ev_hour = cl_abap_context_info=>get_system_time( ).
    ENDIF.

  ENDMETHOD.


  METHOD constructor.
    me->user = sy-uname.
  ENDMETHOD.


  METHOD increment_counter.
    me->counter += iv_counter.
    me->check_limit( ).
  ENDMETHOD.
ENDCLASS.
