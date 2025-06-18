*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

* CCIMP

CLASS lcl_helper IMPLEMENTATION.

  METHOD get_first.

*rs_first =
  ENDMETHOD.

ENDCLASS.


TYPES: BEGIN OF ty_first2,
         comp1 TYPE string,
         comp2 TYPE string,
         comp3 TYPE string,
       END OF ty_first2.


INTERFACE lif_private_helper2.
  DATA ms_first TYPE ty_first.
ENDINTERFACE.


CLASS lcl_helper2 DEFINITION.

  PUBLIC SECTION.
    DATA ms_first_cl TYPE ty_first.

    METHODS get_first RETURNING VALUE(rs_first) TYPE ty_first.

ENDCLASS.


CLASS lcl_helper2 IMPLEMENTATION.

  METHOD get_first.

  ENDMETHOD.

ENDCLASS.
