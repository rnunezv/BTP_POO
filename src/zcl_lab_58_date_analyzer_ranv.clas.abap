CLASS zcl_lab_58_date_analyzer_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS analyze_date IMPORTING io_previous TYPE REF TO cx_root OPTIONAL
                         RAISING   zcx_lab_56_no_date_ranv.

    METHODS analyze_format IMPORTING io_previous TYPE REF TO cx_root OPTIONAL
                           RAISING   zcx_lab_57_format_unknown_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_58_DATE_ANALYZER_RANV IMPLEMENTATION.


  METHOD analyze_date.
    RAISE EXCEPTION TYPE zcx_lab_56_no_date_ranv
      EXPORTING
        previous = io_previous.

  ENDMETHOD.


  METHOD analyze_format.
    RAISE EXCEPTION TYPE zcx_lab_57_format_unknown_ranv
      EXPORTING
        previous = io_previous.

  ENDMETHOD.
ENDCLASS.
