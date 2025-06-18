CLASS zcl_lab_62_context_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
    DATA mv_time TYPE zsyst_uzeit.
    METHODS constructor.

    CLASS-METHODS get_context RETURNING VALUE(ro_context) TYPE REF TO zcl_lab_62_context_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA mo_context TYPE REF TO zcl_lab_62_context_ranv.

ENDCLASS.



CLASS ZCL_LAB_62_CONTEXT_RANV IMPLEMENTATION.


  METHOD constructor.
    me->mv_time = cl_abap_context_info=>get_system_time( ).
  ENDMETHOD.


  METHOD get_context.

    IF mo_context IS NOT BOUND.
      mo_context = NEW #( ).
    ENDIF.
    ro_context = mo_context.

  ENDMETHOD.
ENDCLASS.
