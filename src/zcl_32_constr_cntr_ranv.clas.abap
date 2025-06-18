CLASS zcl_32_constr_cntr_ranv DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_09_contract_ranv .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_32_CONSTR_CNTR_RANV IMPLEMENTATION.


  METHOD zif_09_contract_ranv~create_contract.
    me->zif_09_contract_ranv~contract_type = iv_cntr_type.
  ENDMETHOD.
ENDCLASS.
