*"* use this source file for your ABAP unit test classes
CLASS ltcl_business_process DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      factorial_local_tst FOR TESTING RAISING cx_static_check.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA mo_cut TYPE REF TO zcl_55_business_pr_ranv.   " CUT: Class Under Test

ENDCLASS.


CLASS ltcl_business_process IMPLEMENTATION.

  METHOD factorial_local_tst.

    " Given
    DATA(lv_number_ut) = 4.
    DATA lv_factorial_ut TYPE i.

    " When
    mo_cut->get_factorial(
      EXPORTING
        iv_number    = lv_number_ut
      IMPORTING
        ev_factorial = lv_factorial_ut ).

    " Then
    IF cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_factorial_ut
        exp                  = 24 ) EQ abap_true.


      cl_abap_unit_assert=>fail( 'Factorial process failed' ).

    ENDIF.

  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD setup.
    mo_cut = NEW zcl_55_business_pr_ranv( ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR mo_cut.
  ENDMETHOD.

ENDCLASS.
