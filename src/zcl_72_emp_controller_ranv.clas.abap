CLASS zcl_72_emp_controller_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: set_model IMPORTING io_model TYPE REF TO zcl_70_emp_model_ranv,
             get_model RETURNING VALUE(ro_model) TYPE REF TO zcl_70_emp_model_ranv.

    METHODS: set_view IMPORTING io_view TYPE REF TO zcl_71_emp_view_ranv,
             get_view RETURNING VALUE(ro_view) TYPE REF TO zcl_71_emp_view_ranv.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA: model TYPE REF TO zcl_70_emp_model_ranv,
          view  TYPE REF TO zcl_71_emp_view_ranv.
ENDCLASS.



CLASS ZCL_72_EMP_CONTROLLER_RANV IMPLEMENTATION.


  METHOD get_model.
    ro_model = me->model.
  ENDMETHOD.


  METHOD get_view.
    ro_view = me->view.
  ENDMETHOD.


  METHOD set_model.
    me->model = io_model.
  ENDMETHOD.


  METHOD set_view.
    me->view = io_view.
  ENDMETHOD.
ENDCLASS.
