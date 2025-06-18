CLASS zcl_lab_46_mobile_operator_rnv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-EVENTS new_call EXPORTING VALUE(ev_phone_number) TYPE string.

    CLASS-METHODS assign_call.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_46_MOBILE_OPERATOR_RNV IMPLEMENTATION.


  METHOD assign_call.
    RAISE EVENT new_call EXPORTING ev_phone_number = |Phone Number: { cl_abap_context_info=>get_system_time( ) } |.
  ENDMETHOD.
ENDCLASS.
