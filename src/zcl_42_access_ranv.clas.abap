CLASS zcl_42_access_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.

    METHODS on_blocked_entrance FOR EVENT blocked_entrance OF zcl_41_building_ranv
      IMPORTING ev_entry.

    CLASS-DATA table_blocked_entries TYPE TABLE OF string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_42_ACCESS_RANV IMPLEMENTATION.


  METHOD constructor.
    SET HANDLER me->on_blocked_entrance FOR ALL INSTANCES.
  ENDMETHOD.


  METHOD on_blocked_entrance.
    APPEND |{ ev_entry } entry blocked| TO table_blocked_entries.
  ENDMETHOD.
ENDCLASS.
