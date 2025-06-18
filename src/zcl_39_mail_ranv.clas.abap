CLASS zcl_39_mail_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-EVENTS new_mail EXPORTING VALUE(ev_subject) TYPE string.

    CLASS-METHODS compose_mail.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_39_MAIL_RANV IMPLEMENTATION.


  METHOD compose_mail.
    RAISE EVENT new_mail EXPORTING ev_subject = |ABAP programmer job offer: { cl_abap_context_info=>get_system_time( ) } |.
  ENDMETHOD.
ENDCLASS.
