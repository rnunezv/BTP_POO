CLASS zcl_41_building_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    EVENTS blocked_entrance EXPORTING VALUE(ev_entry) TYPE string.

    METHODS close_entry.

    DATA entry TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_41_BUILDING_RANV IMPLEMENTATION.


  METHOD close_entry.
    RAISE EVENT blocked_entrance EXPORTING ev_entry = me->entry.
  ENDMETHOD.
ENDCLASS.
