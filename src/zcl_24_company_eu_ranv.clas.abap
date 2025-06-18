CLASS zcl_24_company_eu_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_08_co_company_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_24_COMPANY_EU_RANV IMPLEMENTATION.


  METHOD zif_08_co_company_ranv~define_company.
    rv_company = 'Company Europe'.
  ENDMETHOD.
ENDCLASS.
