CLASS zcl_43_components_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_44_comp_friends_ranv.

  PUBLIC SECTION.
    METHODS get_first EXPORTING ev_first TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA ms_second TYPE ty_first.

    DATA mo_helper TYPE REF TO lcl_helper.

ENDCLASS.



CLASS ZCL_43_COMPONENTS_RANV IMPLEMENTATION.


  METHOD get_first.
    DATA ls_first TYPE ty_first.
    ev_first = me->ms_second-comp1.

    DATA lo_helper TYPE REF TO lcl_helper2.
    DATA ls_second TYPE ty_first2.

  ENDMETHOD.
ENDCLASS.
