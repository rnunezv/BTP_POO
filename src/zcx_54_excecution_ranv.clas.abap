CLASS zcx_54_excecution_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: raise_exception1 IMPORTING io_previous TYPE REF TO cx_root OPTIONAL
                              RAISING   zcx_51_exception1_ranv.

    METHODS: raise_exception2 IMPORTING io_previous TYPE REF TO cx_root OPTIONAL
                              RAISING   zcx_52_exception2_ranv.

    METHODS: raise_exception3 IMPORTING io_previous TYPE REF TO cx_root OPTIONAL
                              RAISING   zcx_53_exception3_ranv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCX_54_EXCECUTION_RANV IMPLEMENTATION.


  METHOD raise_exception1.
    RAISE EXCEPTION TYPE zcx_51_exception1_ranv
      EXPORTING
        previous = io_previous.
  ENDMETHOD.


  METHOD raise_exception2.
    RAISE EXCEPTION TYPE zcx_52_exception2_ranv
      EXPORTING
        previous = io_previous.
  ENDMETHOD.


  METHOD raise_exception3.
    RAISE EXCEPTION TYPE zcx_53_exception3_ranv
      EXPORTING
        previous = io_previous.
  ENDMETHOD.
ENDCLASS.
