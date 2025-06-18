*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*CCIMP

CLASS lcl_helper IMPLEMENTATION.

  METHOD get_work_zone.
    rs_work_zone = me->ms_work_zone.
  ENDMETHOD.

ENDCLASS.
