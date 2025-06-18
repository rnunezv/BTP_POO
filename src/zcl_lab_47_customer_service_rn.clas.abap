CLASS zcl_lab_47_customer_service_rn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS on_new_call FOR EVENT new_call OF zcl_lab_46_mobile_operator_rnv
      IMPORTING ev_phone_number.

    CLASS-DATA table_calls TYPE TABLE OF string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_47_CUSTOMER_SERVICE_RN IMPLEMENTATION.


  METHOD on_new_call.
    APPEND ev_phone_number TO table_calls.
  ENDMETHOD.
ENDCLASS.
