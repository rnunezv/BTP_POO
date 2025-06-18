CLASS zcl_lab_66_travel_ranv DEFINITION ABSTRACT
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS travel FINAL IMPORTING iv_out TYPE REF TO if_oo_adt_classrun_out.

  PROTECTED SECTION.
    METHODS transport_oneway ABSTRACT IMPORTING iv_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS day_one          ABSTRACT IMPORTING iv_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS day_two          ABSTRACT IMPORTING iv_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS day_three        ABSTRACT IMPORTING iv_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS transport_return ABSTRACT IMPORTING iv_out TYPE REF TO if_oo_adt_classrun_out.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_66_TRAVEL_RANV IMPLEMENTATION.


  METHOD travel.

    me->transport_oneway( EXPORTING iv_out = iv_out ).
    me->day_one( EXPORTING iv_out = iv_out ).
    me->day_two( EXPORTING iv_out = iv_out ).
    me->day_three( EXPORTING iv_out = iv_out ).
    me->transport_return( EXPORTING iv_out = iv_out ).

  ENDMETHOD.
ENDCLASS.
