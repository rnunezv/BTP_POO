CLASS zcl_lab_06_elements_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_elem_objects,
             class     TYPE string,
             instance  TYPE string,
             reference TYPE string,
           END OF ty_elem_objects.

    CONSTANTS: c_pais   TYPE string VALUE 'Chile',
               c_region TYPE string VALUE 'Metropolitana',
               c_ciudad TYPE string VALUE 'Santiago',
               c_comuna TYPE string VALUE 'Macul'.

    METHODS: set_object CHANGING is_object TYPE ty_elem_objects.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_06_ELEMENTS_RANV IMPLEMENTATION.


  METHOD set_object.
    is_object = VALUE #(
                        class     = 'Clase'
                        instance  = 'Instancia'
                        reference = 'Ejecución'
                       ).

  ENDMETHOD.
ENDCLASS.
