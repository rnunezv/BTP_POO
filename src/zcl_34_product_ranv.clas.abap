CLASS zcl_34_product_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS return_category RETURNING VALUE(rv_category) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA category TYPE string VALUE 'A5'.

ENDCLASS.



CLASS ZCL_34_PRODUCT_RANV IMPLEMENTATION.


  METHOD return_category.
    rv_category = me->category.
  ENDMETHOD.
ENDCLASS.
