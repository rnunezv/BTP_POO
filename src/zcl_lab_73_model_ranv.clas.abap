CLASS zcl_lab_73_model_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_carrier_id TYPE /dmo/flight-carrier_id.
    METHODS set_carrier_id IMPORTING iv_carrier_id TYPE /dmo/flight-carrier_id.
    METHODS get_flight RETURNING VALUE(rt_flight) TYPE /dmo/t_flight.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA carrier_id TYPE /dmo/flight-carrier_id.

ENDCLASS.



CLASS ZCL_LAB_73_MODEL_RANV IMPLEMENTATION.


  METHOD constructor.
    me->carrier_id = iv_carrier_id.
  ENDMETHOD.


  METHOD get_flight.

    SELECT *
    FROM /dmo/flight
    WHERE carrier_id = @me->carrier_id
    INTO TABLE @rt_flight.

  ENDMETHOD.


  METHOD set_carrier_id.
    me->carrier_id = iv_carrier_id.
  ENDMETHOD.
ENDCLASS.
