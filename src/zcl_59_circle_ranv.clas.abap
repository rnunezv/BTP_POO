CLASS zcl_59_circle_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_lab_11_geometric_figure_rn.
    ALIASES draw_shape FOR zif_lab_11_geometric_figure_rn~draw_shape.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_59_CIRCLE_RANV IMPLEMENTATION.


  METHOD zif_lab_11_geometric_figure_rn~draw_shape.
    rv_shape = 'Circle'.
  ENDMETHOD.
ENDCLASS.
