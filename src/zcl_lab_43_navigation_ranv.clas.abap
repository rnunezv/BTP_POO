CLASS zcl_lab_43_navigation_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA log TYPE string.

    METHODS on_touch_screen FOR EVENT touch_screen OF zcl_lab_42_screen_ranv
                            IMPORTING ev_horizontal
                                      ev_vertical
                                      sender.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_43_NAVIGATION_RANV IMPLEMENTATION.


  METHOD on_touch_screen.
    me->log = |Touch screen: horizontal { ev_horizontal } - Vertical { ev_vertical } -- Screen Type { sender->screen_type }|.
  ENDMETHOD.
ENDCLASS.
