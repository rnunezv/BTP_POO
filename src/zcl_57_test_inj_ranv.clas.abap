CLASS zcl_57_test_inj_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_customer EXPORTING es_customer TYPE /dmo/customer.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_57_TEST_INJ_RANV IMPLEMENTATION.


  METHOD get_customer.

    DATA: ls_customer TYPE /dmo/customer,
          lv_customer TYPE /dmo/customer_id.

    lv_customer = '000001'.

    SELECT *
    FROM /dmo/customer
    WHERE customer_id = @lv_customer
    INTO @es_customer UP TO 1 ROWS.
    ENDSELECT.

    TEST-SEAM select_data.
      SELECT *
      FROM /dmo/customer
      WHERE customer_id = @lv_customer
      INTO @ls_customer UP TO 1 ROWS.
      ENDSELECT.
    END-TEST-SEAM.

    IF lv_customer = '000015'.
      es_customer = CORRESPONDING #( ls_customer ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
