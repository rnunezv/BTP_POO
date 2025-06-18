CLASS zcl_lab_61_travel_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_travel EXPORTING es_flights TYPE /dmo/flight.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_61_TRAVEL_RANV IMPLEMENTATION.


  METHOD get_travel.

    DATA: ls_flights    TYPE /dmo/flight,
          lv_carrier_id TYPE /dmo/carrier_id.

    lv_carrier_id = 'SQ'.

    SELECT *
    FROM /dmo/flight
    WHERE carrier_id = @lv_carrier_id
    INTO @es_flights UP TO 1 ROWS.
    ENDSELECT.

    TEST-SEAM select_data.
      SELECT *
      FROM /dmo/flight
      WHERE carrier_id = @lv_carrier_id
      INTO @ls_flights UP TO 1 ROWS.
      ENDSELECT.
    END-TEST-SEAM.

    IF lv_carrier_id = 'AA'.
      es_flights = CORRESPONDING #( ls_flights ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
