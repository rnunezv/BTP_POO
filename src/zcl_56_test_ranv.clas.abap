CLASS zcl_56_test_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  RISK LEVEL HARMLESS " Dangerous - Critical
  DURATION SHORT.     " Medium - Long

  PUBLIC SECTION.
    "! @testing zcl_55_business_pr_ranv
    METHODS factorial_test FOR TESTING.   " UTM - Unit Test Method

  PROTECTED SECTION.

  PRIVATE SECTION.
    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA mo_cut TYPE REF TO zcl_55_business_pr_ranv.   " CUT: Class Under Test

ENDCLASS.



CLASS ZCL_56_TEST_RANV IMPLEMENTATION.


  METHOD class_setup.

  ENDMETHOD.


  METHOD class_teardown.

  ENDMETHOD.


  METHOD factorial_test.

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
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_factorial_ut
        exp                  = 24
    ).

  ENDMETHOD.


  METHOD setup.
    mo_cut = NEW zcl_55_business_pr_ranv( ).
  ENDMETHOD.


  METHOD teardown.
    CLEAR mo_cut.
  ENDMETHOD.
ENDCLASS.
