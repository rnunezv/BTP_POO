CLASS zcl_lab_30_org_germany_ranv DEFINITION INHERITING FROM zcl_lab_29_organization_ranv
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_location REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_30_ORG_GERMANY_RANV IMPLEMENTATION.


  METHOD get_location.
    rv_location = 'Germany'.
  ENDMETHOD.
ENDCLASS.
