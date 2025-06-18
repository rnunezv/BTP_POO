*"* use this source file for your ABAP unit test classes
CLASS ltcl_travel DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
    INTERFACES if_a4c_bc_handler PARTIALLY IMPLEMENTED.

  PRIVATE SECTION.
    METHODS:
      get_travel_test FOR TESTING RAISING cx_static_check.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA mo_cut TYPE REF TO zcl_lab_61_travel_ranv.

ENDCLASS.

CLASS ltcl_travel IMPLEMENTATION.

  METHOD get_travel_test.

    me->mo_cut->get_travel( IMPORTING es_flights = DATA(ls_flights) ).

    IF cl_abap_unit_assert=>assert_equals(
         act                  = |{ ls_flights-connection_id }-{ ls_flights-currency_code }|
         exp                  = '0322-USD' ) EQ abap_true.

      cl_abap_unit_assert=>fail( 'Get Travel Process Failed-->zcl_lab_61_travel_ranv->get_travel' ).
    ENDIF.
  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD setup.
    me->mo_cut = NEW zcl_lab_61_travel_ranv( ).

    TEST-INJECTION select_data.
      lv_carrier_id = 'AA'.
      ls_flights-carrier_id = lv_carrier_id.
      ls_flights-connection_id = '0322'.
      ls_flights-currency_code = 'USD'.
    END-TEST-INJECTION.
  ENDMETHOD.

  METHOD teardown.
    CLEAR me->mo_cut.
  ENDMETHOD.

  METHOD if_a4c_bc_handler~add_to_transport_request.

  ENDMETHOD.

ENDCLASS.
