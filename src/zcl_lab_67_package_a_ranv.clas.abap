CLASS zcl_lab_67_package_a_ranv DEFINITION INHERITING FROM zcl_lab_66_travel_ranv
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS: transport_oneway REDEFINITION,
      day_one REDEFINITION,
      day_two REDEFINITION,
      day_three REDEFINITION,
      transport_return REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_67_PACKAGE_A_RANV IMPLEMENTATION.


  METHOD day_one.
    iv_out->write( |Package A--> Day one| ).
  ENDMETHOD.


  METHOD day_three.
    iv_out->write( |Package A--> Day three| ).
  ENDMETHOD.


  METHOD day_two.
    iv_out->write( |Package A--> Day two| ).
  ENDMETHOD.


  METHOD transport_oneway.
    iv_out->write( |Package A--> Transport oneway| ).
  ENDMETHOD.


  METHOD transport_return.
    iv_out->write( |Package A--> Transport return| ).
  ENDMETHOD.
ENDCLASS.
