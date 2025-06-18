CLASS zcl_lab_49_employee_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS on_payroll_paid FOR EVENT payroll_paid OF zcl_lab_48_adminis_dep_ranv
      IMPORTING ev_employee_id.

    DATA: log TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_49_EMPLOYEE_RANV IMPLEMENTATION.


  METHOD on_payroll_paid.
    me->log = |Event handler for employee ID: { ev_employee_id }|.
  ENDMETHOD.
ENDCLASS.
