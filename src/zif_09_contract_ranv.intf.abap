INTERFACE zif_09_contract_ranv
  PUBLIC .
  DATA contract_type TYPE string.
  METHODS create_contract IMPORTING iv_cntr_type TYPE string.

ENDINTERFACE.
