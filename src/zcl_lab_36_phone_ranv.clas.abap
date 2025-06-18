CLASS zcl_lab_36_phone_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: constructor IMPORTING io_screen TYPE REF TO zcl_lab_37_screen_ranv,
      get_screen RETURNING VALUE(ro_screen) TYPE REF TO zcl_lab_37_screen_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA screen TYPE REF TO zcl_lab_37_screen_ranv.

ENDCLASS.



CLASS ZCL_LAB_36_PHONE_RANV IMPLEMENTATION.


  METHOD constructor.
    me->screen = io_screen.
  ENDMETHOD.


  METHOD get_screen.
    ro_screen = me->screen.
  ENDMETHOD.
ENDCLASS.
