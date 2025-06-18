CLASS zcl_lab_60_test_calc_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
    "! @testing zcl_lab_59_calculator_ranv
    METHODS test_calc FOR TESTING.   " UTM - Unit Test Method

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA mo_cut TYPE REF TO zcl_lab_59_calculator_ranv.
ENDCLASS.



CLASS ZCL_LAB_60_TEST_CALC_RANV IMPLEMENTATION.


  METHOD class_setup.

  ENDMETHOD.


  METHOD class_teardown.

  ENDMETHOD.


  METHOD setup.
    mo_cut = NEW zcl_lab_59_calculator_ranv( ).
  ENDMETHOD.


  METHOD teardown.
    CLEAR mo_cut.
  ENDMETHOD.


  METHOD test_calc.

    " Given
    DATA(lv_num1_ut) = 3.
    DATA(lv_num2_ut) = 4.
    DATA lv_sum_ut TYPE i.

    " When
    mo_cut->sum_up(
      EXPORTING
        iv_num1 = lv_num1_ut
        iv_num2 = lv_num2_ut
      IMPORTING
        ev_sum  = lv_sum_ut
    ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_sum_ut
        exp                  = 7
    ).

  ENDMETHOD.
ENDCLASS.
