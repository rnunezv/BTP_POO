CLASS zcl_lab_50_work_zone_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_lab_51_wz_friend_ranv.

  PUBLIC SECTION.
  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA ms_work_zone TYPE ty_work_zone.

    METHODS set_work_zone IMPORTING is_work_zone TYPE ty_work_zone.

    DATA mo_helper TYPE REF TO lcl_helper.

ENDCLASS.



CLASS ZCL_LAB_50_WORK_ZONE_RANV IMPLEMENTATION.


  METHOD set_work_zone.
    me->ms_work_zone = is_work_zone.
  ENDMETHOD.
ENDCLASS.
