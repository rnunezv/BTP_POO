CLASS zcl_lab_54_bank_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS transfer IMPORTING iv_iban TYPE string
                     RAISING   RESUMABLE(zcx_lab_55_auth_iban_ranv).

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_54_BANK_RANV IMPLEMENTATION.


  METHOD transfer.

    IF iv_iban EQ 'ES95 4329 8765 4321'.

      RAISE RESUMABLE EXCEPTION TYPE zcx_lab_55_auth_iban_ranv
        EXPORTING
          textid = zcx_lab_55_auth_iban_ranv=>no_auth.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
