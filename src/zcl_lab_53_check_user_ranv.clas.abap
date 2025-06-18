CLASS zcl_lab_53_check_user_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS check_user IMPORTING iv_user TYPE syuname
                       RAISING   zcx_lab_52_operations_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_53_CHECK_USER_RANV IMPLEMENTATION.


  METHOD check_user.

    IF sy-uname EQ iv_user.

      RAISE EXCEPTION TYPE zcx_lab_52_operations_ranv
        EXPORTING
          textid = zcx_lab_52_operations_ranv=>no_access
*         previous =
          msg1   = |{ sy-uname }|
          msg2   = 'File_Name'
*         msg3   =
*         msg4   =
        .

    ENDIF.

  ENDMETHOD.
ENDCLASS.
