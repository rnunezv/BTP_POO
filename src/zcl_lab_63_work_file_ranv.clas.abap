CLASS zcl_lab_63_work_file_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_lab_06_file_ranv.
    ALIASES get_file_type FOR zif_lab_06_file_ranv~get_file_type.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_63_WORK_FILE_RANV IMPLEMENTATION.


  METHOD zif_lab_06_file_ranv~get_file_type.
    rv_file_type = 'Work File'.
  ENDMETHOD.
ENDCLASS.
