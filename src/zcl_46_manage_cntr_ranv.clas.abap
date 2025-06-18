CLASS zcl_46_manage_cntr_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS check_user IMPORTING iv_user TYPE syuname
                       RAISING   zcx_45_auth_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_46_MANAGE_CNTR_RANV IMPLEMENTATION.


  METHOD check_user.

    IF sy-uname EQ 'CB9980001119'.

      RAISE EXCEPTION TYPE zcx_45_auth_ranv
        EXPORTING
          textid = zcx_45_auth_ranv=>no_auth
*         previous =
          msg1   = |{ sy-uname }|
          msg2   = 'Edit Contract'
*         msg3   =
*         msg4   =
        .

    ELSE.

    ENDIF..

  ENDMETHOD.
ENDCLASS.
