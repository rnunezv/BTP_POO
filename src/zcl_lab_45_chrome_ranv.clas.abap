CLASS zcl_lab_45_chrome_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS on_close_window FOR EVENT close_window OF zif_lab_05_browser_ranv.

    DATA log_chrome TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_45_CHROME_RANV IMPLEMENTATION.


  METHOD on_close_window.
    me->log_chrome = |Close window at { cl_abap_context_info=>get_system_time( ) }|.
  ENDMETHOD.
ENDCLASS.
