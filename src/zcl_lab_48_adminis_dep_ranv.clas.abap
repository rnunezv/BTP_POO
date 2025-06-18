CLASS zcl_lab_48_adminis_dep_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    EVENTS payroll_paid EXPORTING VALUE(ev_employee_id) TYPE string.

    METHODS: constructor IMPORTING iv_employee_id TYPE string,
      notify_employee.

    DATA: employee_id TYPE string,
          log         TYPE string.

  PROTECTED   SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_48_ADMINIS_DEP_RANV IMPLEMENTATION.


  METHOD constructor.
    me->employee_id = iv_employee_id.
  ENDMETHOD.


  METHOD notify_employee.

    me->log = |Raise event for employee ID: { me->employee_id }|.
    RAISE EVENT payroll_paid EXPORTING ev_employee_id = me->employee_id.
  ENDMETHOD.
ENDCLASS.
