CLASS zcl_28_client_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: set_credit_card IMPORTING ir_credit_card TYPE REF TO zcl_27_credit_card_ranv,
             get_credit_card RETURNING VALUE(rr_credit_card) TYPE REF TO zcl_27_credit_card_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: credit_card TYPE REF TO zcl_27_credit_card_ranv.

ENDCLASS.



CLASS ZCL_28_CLIENT_RANV IMPLEMENTATION.


  METHOD get_credit_card.
    rr_credit_card = me->credit_card.
  ENDMETHOD.


  METHOD set_credit_card.
    me->credit_card = ir_credit_card.
  ENDMETHOD.
ENDCLASS.
