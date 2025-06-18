CLASS zcl_lab_74_view_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS diplay_flight IMPORTING it_flight TYPE /dmo/t_flight
                                    io_out     TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_74_VIEW_RANV IMPLEMENTATION.


  METHOD diplay_flight.
    io_out->write( it_flight ).
  ENDMETHOD.
ENDCLASS.
