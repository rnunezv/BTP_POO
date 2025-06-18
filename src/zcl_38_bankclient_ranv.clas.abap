CLASS zcl_38_bankclient_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS on_new_transfer FOR EVENT new_transfer OF zif_10_bank_ranv
      IMPORTING sender.

    DATA notification TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_38_BANKCLIENT_RANV IMPLEMENTATION.


  METHOD on_new_transfer.
    me->notification = |{ sender->office }--{ cl_abap_context_info=>get_system_time( ) }|.
  ENDMETHOD.
ENDCLASS.
