CLASS zcl_lab_69_blog_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: set_article IMPORTING iv_article TYPE string,
      get_article RETURNING VALUE(rv_article) TYPE string.

    EVENTS new_article EXPORTING VALUE(ev_new_article) TYPE string.
  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA current_article TYPE string.

ENDCLASS.



CLASS ZCL_LAB_69_BLOG_RANV IMPLEMENTATION.


  METHOD get_article.
    rv_article = me->current_article.
  ENDMETHOD.


  METHOD set_article.
    me->current_article = iv_article.
    RAISE EVENT new_article EXPORTING ev_new_article = me->current_article.
  ENDMETHOD.
ENDCLASS.
