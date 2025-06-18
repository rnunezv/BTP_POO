*"* use this source file for your ABAP unit test classes
CLASS ltcl_test_inj DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
    INTERFACES if_a4c_bc_handler PARTIALLY IMPLEMENTED.

  PRIVATE SECTION.
    METHODS:
      get_customer_test FOR TESTING RAISING cx_static_check.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA mo_cut TYPE REF TO zcl_57_test_inj_ranv.
ENDCLASS.


CLASS ltcl_test_inj IMPLEMENTATION.

  METHOD get_customer_test.


    me->mo_cut->get_customer( IMPORTING es_customer = DATA(ls_customer)  ).

    IF cl_abap_unit_assert=>assert_equals(
         act                  = |{ ls_customer-customer_id }-{ ls_customer-country_code }|
         exp                  = '000015-US' ) EQ abap_true.

      cl_abap_unit_assert=>fail( 'Get Customer Process Failed---zcl_57_test_inj_ranv->get_customer' ).

    ENDIF.


  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD setup.
    me->mo_cut = NEW  zcl_57_test_inj_ranv( ) .

    TEST-INJECTION select_data.
      lv_customer              = '000015'.
      ls_customer-customer_id  = lv_customer.
      ls_customer-country_code = 'US'.
      ls_customer-city         = 'New York'.
    END-TEST-INJECTION.

  ENDMETHOD.

  METHOD teardown.
    CLEAR me->mo_cut.
  ENDMETHOD.

  METHOD if_a4c_bc_handler~add_to_transport_request.

  ENDMETHOD.

ENDCLASS.
