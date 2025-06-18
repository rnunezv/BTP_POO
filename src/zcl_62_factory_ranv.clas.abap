CLASS zcl_62_factory_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_shape IMPORTING iv_shape_type        TYPE string
                      RETURNING VALUE(ro_shape_type) TYPE REF TO zif_lab_11_geometric_figure_rn.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_62_FACTORY_RANV IMPLEMENTATION.


  METHOD get_shape.

    CASE iv_shape_type.

      WHEN 'Circle'.
        ro_shape_type = NEW zcl_59_circle_ranv( ).

      WHEN 'Square'.
        ro_shape_type = NEW zcl_60_square_ranv( ).

      WHEN 'Triangle'.
        ro_shape_type = NEW zcl_61_triangle_ranv( ).

    ENDCASE.

  ENDMETHOD.
ENDCLASS.
