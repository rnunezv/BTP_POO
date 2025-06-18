CLASS zcl_lab_37_screen_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: set_screen_type IMPORTING iv_screen_type TYPE string,
             get_screen_type RETURNING VALUE(rv_screen_type) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA screen_type TYPE string.

ENDCLASS.



CLASS ZCL_LAB_37_SCREEN_RANV IMPLEMENTATION.


  METHOD get_screen_type.
    rv_screen_type = me->screen_type.
  ENDMETHOD.


  METHOD set_screen_type.
    me->screen_type = iv_screen_type.
  ENDMETHOD.
ENDCLASS.
