CLASS zcl_lab_42_screen_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    EVENTS touch_screen EXPORTING VALUE(ev_horizontal) TYPE i
                                  VALUE(ev_vertical)   TYPE i.

    DATA screen_type TYPE string.
    METHODS:constructor IMPORTING iv_screen_type TYPE string,
            element_selected.

    DATA: horizontal TYPE i,
          vertical   TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_LAB_42_SCREEN_RANV IMPLEMENTATION.


  METHOD constructor.
    me->screen_type = iv_screen_type.
  ENDMETHOD.


  METHOD element_selected.

    RAISE EVENT touch_screen EXPORTING ev_horizontal = me->horizontal
                                       ev_vertical   = me->vertical.
  ENDMETHOD.
ENDCLASS.
