CLASS zcl_lab_32_internal_empl_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_lab_04_employee_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_32_INTERNAL_EMPL_RANV IMPLEMENTATION.


  METHOD zif_lab_04_employee_ranv~get_employees_count.
    rv_employee_count = 32.
  ENDMETHOD.
ENDCLASS.
