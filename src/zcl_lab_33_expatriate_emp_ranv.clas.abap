CLASS zcl_lab_33_expatriate_emp_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_lab_04_employee_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_33_EXPATRIATE_EMP_RANV IMPLEMENTATION.


  METHOD zif_lab_04_employee_ranv~get_employees_count.
    rv_employee_count = 33.
  ENDMETHOD.
ENDCLASS.
