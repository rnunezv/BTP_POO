CLASS zcl_60_square_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_lab_11_geometric_figure_rn.
    ALIASES draw_shape FOR zif_lab_11_geometric_figure_rn~draw_shape.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_60_SQUARE_RANV IMPLEMENTATION.


  METHOD zif_lab_11_geometric_figure_rn~draw_shape.
    rv_shape = 'Square'.
  ENDMETHOD.
ENDCLASS.
