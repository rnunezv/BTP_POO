CLASS zcl_44_comp_friends_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_helper.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_44_COMP_FRIENDS_RANV IMPLEMENTATION.


  METHOD get_helper.

    DATA(lo_components) = NEW zcl_43_components_ranv( ).

    CLEAR lo_components->mo_helper->ms_first_cl.
    DATA(lo_first) = lo_components->mo_helper->get_first( ).

    lo_components->get_first( ).

  ENDMETHOD.
ENDCLASS.
