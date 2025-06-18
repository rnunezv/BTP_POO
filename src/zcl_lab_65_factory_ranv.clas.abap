CLASS zcl_lab_65_factory_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS create_file IMPORTING iv_file_type        TYPE string
                        RETURNING VALUE(ro_file_type) TYPE REF TO zif_lab_06_file_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_65_FACTORY_RANV IMPLEMENTATION.


  METHOD create_file.

    CASE iv_file_type.

      WHEN 'Work File'.
        ro_file_type = NEW zcl_lab_63_work_file_ranv( ).

      WHEN 'Supply File'.
        ro_file_type = NEW zcl_lab_64_supply_file_ranv( ).

    ENDCASE.

  ENDMETHOD.
ENDCLASS.
