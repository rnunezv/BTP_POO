CLASS zcl_30_laptop_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA keyboard TYPE REF TO zcl_29_keyboard_ranv.
    METHODS constructor IMPORTING io_keyboard TYPE REF TO zcl_29_keyboard_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_30_LAPTOP_RANV IMPLEMENTATION.


  METHOD constructor.
    me->keyboard = io_keyboard.
  ENDMETHOD.
ENDCLASS.
