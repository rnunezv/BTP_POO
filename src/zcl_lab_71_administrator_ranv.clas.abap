CLASS zcl_lab_71_administrator_ranv DEFINITION INHERITING FROM zcl_lab_70_observer_ranv
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA article TYPE string.
    METHODS: on_new_article REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_71_ADMINISTRATOR_RANV IMPLEMENTATION.


  METHOD on_new_article.
    me->article = ev_new_article.
  ENDMETHOD.
ENDCLASS.
