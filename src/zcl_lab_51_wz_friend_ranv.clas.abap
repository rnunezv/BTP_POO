CLASS zcl_lab_51_wz_friend_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_helper.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_51_WZ_FRIEND_RANV IMPLEMENTATION.


  METHOD get_helper.

    DATA(lo_work_zone) = NEW zcl_lab_50_work_zone_ranv( ).
    lo_work_zone->mo_helper->get_work_zone( RECEIVING rs_work_zone = DATA(ls_work_zone) ).

  ENDMETHOD.
ENDCLASS.
