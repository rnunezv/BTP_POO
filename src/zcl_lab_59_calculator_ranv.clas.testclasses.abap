*"* use this source file for your ABAP unit test classes
CLASS ltcl_calculator DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      calc_local_test FOR TESTING RAISING cx_static_check.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA mo_cut TYPE REF TO zcl_lab_59_calculator_ranv.

ENDCLASS.


CLASS ltcl_calculator IMPLEMENTATION.

  METHOD calc_local_test.

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
    IF cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_sum_ut
        exp                  = 7 ) EQ abap_true.

      cl_abap_unit_assert=>fail( 'Calc test failed' ).

    ENDIF.

  ENDMETHOD.

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

ENDCLASS.
