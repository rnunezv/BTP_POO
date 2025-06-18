CLASS zcl_37_americanbank_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_10_bank_ranv.

    METHODS create_notification RETURNING VALUE(rv_text) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_37_AMERICANBANK_RANV IMPLEMENTATION.


  METHOD create_notification.

    rv_text = |Event raise ... New transfer - { cl_abap_context_info=>get_system_time( ) }|.
    RAISE EVENT zif_10_bank_ranv~new_transfer.

  ENDMETHOD.
ENDCLASS.
