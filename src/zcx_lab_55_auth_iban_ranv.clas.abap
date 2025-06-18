CLASS zcx_lab_55_auth_iban_ranv DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF no_auth,
        msgid TYPE symsgid VALUE 'ZMC_LAB_52_RANV',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'MV_MSG1',
        attr2 TYPE scx_attrname VALUE 'MV_MSG2',
        attr3 TYPE scx_attrname VALUE 'MV_MSG3',
        attr4 TYPE scx_attrname VALUE 'MV_MSG4',
      END OF no_auth.

    DATA: mv_msg1 TYPE string,
          mv_msg2 TYPE string,
          mv_msg3 TYPE string,
          mv_msg4 TYPE string.



    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        msg1      TYPE string OPTIONAL
        msg2      TYPE string OPTIONAL
        msg3      TYPE string OPTIONAL
        msg4      TYPE string OPTIONAL.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCX_LAB_55_AUTH_IBAN_RANV IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->mv_msg1 = msg1.
    me->mv_msg2 = msg2.
    me->mv_msg3 = msg3.
    me->mv_msg4 = msg4.

  ENDMETHOD.
ENDCLASS.
