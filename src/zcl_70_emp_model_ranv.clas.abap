CLASS zcl_70_emp_model_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_name TYPE string
                                  iv_role TYPE string.

    METHODS: set_name IMPORTING iv_name TYPE string,
      get_name RETURNING VALUE(rv_name) TYPE string.

    METHODS: set_role IMPORTING iv_role TYPE string,
      get_role RETURNING VALUE(rv_role) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA: name TYPE string,
          role TYPE string.
ENDCLASS.



CLASS ZCL_70_EMP_MODEL_RANV IMPLEMENTATION.


  METHOD constructor.
    me->name = iv_name.
    me->role = iv_role.
  ENDMETHOD.


  METHOD get_name.
    rv_name = me->name.
  ENDMETHOD.


  METHOD get_role.
    rv_role = me->role.
  ENDMETHOD.


  METHOD set_name.
    me->name = iv_name.
  ENDMETHOD.


  METHOD set_role.
    me->role = iv_role.
  ENDMETHOD.
ENDCLASS.
