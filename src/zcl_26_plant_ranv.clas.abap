CLASS zcl_26_plant_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS assign_company IMPORTING ir_co_company   TYPE REF TO zif_08_co_company_ranv
                           RETURNING VALUE(rv_plant) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_26_PLANT_RANV IMPLEMENTATION.


  METHOD assign_company.
    rv_plant = |Plant wa assigned to... { ir_co_company->define_company( ) } |.
  ENDMETHOD.
ENDCLASS.
