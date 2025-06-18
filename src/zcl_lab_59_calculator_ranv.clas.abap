CLASS zcl_lab_59_calculator_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS sum_up IMPORTING iv_num1 TYPE i
                             iv_num2 TYPE i
                   EXPORTING ev_sum  TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_59_CALCULATOR_RANV IMPLEMENTATION.


  METHOD sum_up.
    ev_sum = iv_num1 + iv_num2.
  ENDMETHOD.
ENDCLASS.
