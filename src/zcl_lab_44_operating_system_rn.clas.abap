CLASS zcl_lab_44_operating_system_rn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_lab_05_browser_ranv.

    METHODS mouse_movement RETURNING VALUE(rv_log_mouse) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_44_OPERATING_SYSTEM_RN IMPLEMENTATION.


  METHOD mouse_movement.
    rv_log_mouse = |Event raise... Mouse movement at { cl_abap_context_info=>get_system_time( )  }|.
    RAISE EVENT zif_lab_05_browser_ranv~close_window.
  ENDMETHOD.
ENDCLASS.
