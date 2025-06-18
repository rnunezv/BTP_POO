CLASS zcl_lab_35_college_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA student TYPE REF TO zcl_lab_34_student_ranv.
    METHODS enroll_student IMPORTING ir_student TYPE REF TO zcl_lab_34_student_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_35_COLLEGE_RANV IMPLEMENTATION.


  METHOD enroll_student.
    me->student = ir_student.
  ENDMETHOD.
ENDCLASS.
