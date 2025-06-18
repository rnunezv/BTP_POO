CLASS zcl_lab_01_ejec_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    DATA: ms_object TYPE zcl_lab_06_elements_ranv=>ty_elem_objects.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_LAB_01_EJEC_RANV IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**** Patron de diseño Model-View-Controller
    DATA lv_carrier_id TYPE /dmo/flight-carrier_id.

    lv_carrier_id = 'SQ'.

*   Model
    DATA(lo_model) = NEW zcl_lab_73_model_ranv( iv_carrier_id = lv_carrier_id ).

*   view
    DATA(lo_view) = NEW zcl_lab_74_view_ranv( ).

*   Controller
    DATA(lo_controller) = NEW zcl_lab_75_controller_ranv( ).


    lo_controller->set_model( lo_model ).
    lo_controller->set_view( lo_view ).

    lo_controller->get_view( )->diplay_flight(
                                              it_flight = lo_model->get_flight( )
                                              io_out    = out
                                            ).



***** Patron de diseño Observer
*    DATA(lo_blog) = NEW zcl_lab_69_blog_ranv( ).
*    DATA(lo_administrator) = NEW zcl_lab_71_administrator_ranv( ).
*    DATA(lo_users) = NEW zcl_lab_72_users_ranv( ).
*
*    SET HANDLER lo_administrator->on_new_article FOR lo_blog.
*    SET HANDLER lo_users->on_new_article FOR lo_blog.
*
**   Set new article
*    lo_blog->set_article( iv_article = 'Title Article 1' ).
*    out->write( |Blog         : { lo_blog->get_article( ) }| ).
*    out->write( |Administrator: { lo_administrator->article }| ).
*    out->write( |Users        : { lo_users->article }| ).




****  Patron de diseño Template Method
*    DATA(lo_package_a) = NEW zcl_lab_67_package_a_ranv( ).
*    DATA(lo_package_b) = NEW zcl_lab_68_package_b_ranv( ).
*
*    lo_package_a->travel( out ).
*    out->write( cl_abap_char_utilities=>newline ).
*    lo_package_b->travel( out ).



****  Patron de diseño Factory Method
*    DATA lo_file TYPE REF TO zif_lab_06_file_ranv.
*
*    DATA(lo_factory) = NEW zcl_lab_65_factory_ranv( ).
*
*    lo_file = lo_factory->create_file( 'Work File' ).
*    out->write( |File type: { lo_file->get_file_type( ) }| ).
*
*    lo_file = lo_factory->create_file( 'Supply File' ).
*    out->write( |File type: { lo_file->get_file_type( ) }| ).




****  Patron de diseño Singleton
*    DATA: lo_context_1 TYPE REF TO zcl_lab_62_context_ranv,
*          lo_context_2 TYPE REF TO zcl_lab_62_context_ranv.
*
*    lo_context_1 = zcl_lab_62_context_ranv=>get_context( ).
*    WAIT UP TO 2 SECONDS.
*    lo_context_2 = zcl_lab_62_context_ranv=>get_context( ).
*
*    out->write( |Hora instancia 1: { lo_context_1->mv_time }| ).
*    out->write( |Hora instancia 2: { lo_context_2->mv_time }| ).


**** Test Injection
*    DATA(lo_travel) = NEW zcl_lab_61_travel_ranv( ).
*
*    lo_travel->get_travel( IMPORTING es_flights = DATA(ls_flights) ).
*    out->write( |{ ls_flights-connection_id }-{ ls_flights-currency_code }| ).



**** Asignacion de excepciones unas a otras
*    DATA(lo_date_analyzer) = NEW zcl_lab_58_date_analyzer_ranv( ).
*
*
*    TRY.
*        TRY.
*
*            lo_date_analyzer->analyze_date( ).
*          CATCH zcx_lab_56_no_date_ranv INTO DATA(lx_no_date).
*            lo_date_analyzer->analyze_format( io_previous = lx_no_date ).
*
*        ENDTRY.
*
*      CATCH zcx_lab_57_format_unknown_ranv INTO DATA(lx_format_unknown).
*
*        out->write( |Format: { lx_format_unknown->get_text( ) }{ cl_abap_char_utilities=>newline }| ).
*
*        IF lx_format_unknown->previous IS BOUND.
*          out->write( |Date: { lx_format_unknown->previous->get_text( ) }{ cl_abap_char_utilities=>newline }| ).
*        ENDIF.
*
*        IF lx_format_unknown->previous->previous IS BOUND.
*          out->write( |{ lx_format_unknown->previous->previous->get_text( ) }{ cl_abap_char_utilities=>newline }| ).
*        ENDIF.
*
*    ENDTRY.



**** Excepciones Reanudables
*
*    DATA(lo_bank) = NEW zcl_lab_54_bank_ranv( ).
*
*    TRY.
*
*        out->write( |Validate IBAN...| ).
*        lo_bank->transfer( 'ES95 4329 8765 4321' ).
*
*      CATCH BEFORE UNWIND zcx_lab_55_auth_iban_ranv INTO DATA(lx_auth_iban).
*        out->write( |Resumable exception... { lx_auth_iban->get_text( ) }| ).
*        RESUME.
*
*    ENDTRY.



**** Granularidad
*    DATA:lv_result TYPE i,
*         lv_num1   TYPE i VALUE 10,
*         lv_num2   TYPE i.
*
*
*    TRY.
*
*        lv_result = lv_num1 / lv_num2.
*
*      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).
*        out->write( lx_zerodivide->get_text( ) ).
*        lv_num2 = 5.
*        RETRY.
*
*      CATCH cx_static_check INTO DATA(lx_static).
*        out->write( 'Static check' ).
*
*      CATCH cx_root INTO DATA(lx_root).
*        out->write( 'Root' ).
*
*    ENDTRY.
*
*    out->write( |FINISH| ).
*    out->write( |Result = { lv_result }| ).



**** RETRY
*    DATA:lv_result TYPE i,
*         lv_num1   TYPE i VALUE 10,
*         lv_num2   TYPE i.
*
*
*    TRY.
*
*        lv_result = lv_num1 / lv_num2.
*
*      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).
*        out->write( lx_zerodivide->get_text( ) ).
*        lv_num2 = 5.
*        RETRY.
*    ENDTRY.
*
*    out->write( |FINISH| ).
*    out->write( |Result = { lv_result }| ).


**** Exceptions TRY-CATCH-ENTRY
*    DATA(lo_check_user) = NEW zcl_lab_53_check_user_ranv( ).
*
*    TRY.
*        lo_check_user->check_user( sy-uname ).
*
*      CATCH zcx_lab_52_operations_ranv INTO DATA(lx_operations).
*        out->write( lx_operations->get_text( ) ).
*    ENDTRY.



**** Manejar eventos para todas las instancias de la clase
*    DATA(lo_employee) = NEW zcl_lab_49_employee_ranv( ).
*
*    SET HANDLER lo_employee->on_payroll_paid FOR ALL INSTANCES.
*
*    DATA(lo_administrative_1) = NEW zcl_lab_48_adminis_dep_ranv( 'EMP_001' ).
*    DATA(lo_administrative_2) = NEW zcl_lab_48_adminis_dep_ranv( 'EMP_002' ).
*    DATA(lo_administrative_3) = NEW zcl_lab_48_adminis_dep_ranv( 'EMP_003' ).
*
*
*    lo_administrative_1->notify_employee( ).
*    out->write( lo_administrative_1->log ).
*    out->write( lo_employee->log ).
*    out->write( '******************************************' ).
*
*    lo_administrative_2->notify_employee( ).
*    out->write( lo_administrative_2->log ).
*    out->write( lo_employee->log ).
*    out->write( '******************************************' ).
*
*    lo_administrative_3->notify_employee( ).
*    out->write( lo_administrative_3->log ).
*    out->write( lo_employee->log ).


**** Eventos estaticos
*    SET HANDLER zcl_lab_47_customer_service_rn=>on_new_call.
*
*    DO 5 TIMES.
*
*      WAIT UP TO 1 SECONDS.
*      zcl_lab_46_mobile_operator_rnv=>assign_call( ).
*    ENDDO.
*
*    out->write( zcl_lab_47_customer_service_rn=>table_calls ).



**** Desactivar objeto manejador
*    DATA(lo_operating_system) = NEW zcl_lab_44_operating_system_rn( ).
*    DATA(lo_chrome) = NEW zcl_lab_45_chrome_ranv( ).
*
*    SET HANDLER lo_chrome->on_close_window FOR lo_operating_system.
*
*    DO 5 TIMES.
*
*      WAIT UP TO 1 SECONDS.
*
*      out->write( lo_operating_system->mouse_movement( ) ).
*      out->write( lo_chrome->log_chrome ).
*
*      IF sy-index = 2.
*        SET HANDLER lo_chrome->on_close_window FOR lo_operating_system ACTIVATION abap_false.
*        lo_chrome->log_chrome = |No handler for event close_window|.
*      ENDIF.
*
*    ENDDO.



**** Definir Eventos en las interfaces
*    DATA(lo_operating_system) = NEW zcl_lab_44_operating_system_rn( ).
*    DATA(lo_chrome) = NEW zcl_lab_45_chrome_ranv( ).
*
*    SET HANDLER lo_chrome->on_close_window FOR lo_operating_system.
*
*    DO 5 TIMES.
*
*      WAIT UP TO 1 SECONDS.
*
*      out->write( lo_operating_system->mouse_movement( ) ).
*      out->write( lo_chrome->log_chrome ).
*
*    ENDDO.



****  Establecer referencia manejadora de Eventos
*    DATA(lo_screen) = NEW zcl_lab_42_screen_ranv( 'LED' ).
*    DATA(lo_navigation) = NEW zcl_lab_43_navigation_ranv( ).
*
*    SET HANDLER lo_navigation->on_touch_screen FOR lo_screen.
*
*    lo_screen->horizontal = 10.
*    lo_screen->vertical   = 20.
*
*    IF lo_navigation->log IS INITIAL.
*      out->write( |El evento no ha sido lanzado| ).
*    ENDIF.
*
*    lo_screen->element_selected( ).
*    out->write( |LOG: { lo_navigation->log }| ).



**** Asignar instancias utilizando la clase genérica OBJECT
*    DATA lo_object TYPE REF TO object.
*    lo_object = NEW zcl_lab_41_organization_ranv( ).
*
*    DATA(lv_method_name_set) = 'SET_HEADQUARTERS'.
*    CALL METHOD lo_object->(lv_method_name_set) EXPORTING iv_headquarters = 'Headquarters_1'.
*
*    DATA lv_headquarters TYPE string.
*    DATA(lv_method_name_get) = 'GET_HEADQUARTERS'.
*    CALL METHOD lo_object->(lv_method_name_get) RECEIVING rv_headquarters = lv_headquarters.
*
*    out->write( lv_headquarters ).



**** Instancias de distintos tipos
*    DATA lo_budget TYPE REF TO zcl_lab_39_budget_ranv.
*
*    lo_budget = NEW zcl_lab_40_actual_budget_ranv( ).
*
*    out->write( lo_budget->get_budget( ) ).



**** Multiples Referencias
*    DATA: lo_prod_price_1 TYPE REF TO zcl_lab_38_prod_price_ranv,
*          lo_prod_price_2 TYPE REF TO zcl_lab_38_prod_price_ranv.
*
*
*    lo_prod_price_1 = NEW #( ).
*
*    lo_prod_price_1->price = 1000.
*    out->write( lo_prod_price_1->price ).
*
*    lo_prod_price_2 = lo_prod_price_1.
*    lo_prod_price_2->price = 2000.
*
*    out->write( lo_prod_price_1->price ).



**** Composición
*    DATA(lo_screen) = NEW zcl_lab_37_screen_ranv( ).
*    DATA(lo_phone) = NEW zcl_lab_36_phone_ranv( lo_screen ).
*
*    lo_screen->set_screen_type( 'LCD' ).
*    out->write( lo_phone->get_screen( )->get_screen_type( ) ).


**** Asociación
*    DATA(lo_student) = NEW zcl_lab_34_student_ranv( ).
*    DATA(lo_college) = NEW zcl_lab_35_college_ranv( ).
*
*    lo_student->set_name( 'Raúl Núñez' ).
*    lo_college->enroll_student( lo_student ).
*    out->write( lo_college->student->get_name( ) ).


**** Polimorfismo con Interfaces
*    DATA: lt_employees TYPE STANDARD TABLE OF REF TO zif_lab_04_employee_ranv.
*
*    DATA(lo_internal_empl) = NEW zcl_lab_32_internal_empl_ranv( ).
*    APPEND lo_internal_empl TO lt_employees.
*
*    DATA(lo_expatriate_empl) = NEW zcl_lab_33_expatriate_emp_ranv( ).
*    APPEND lo_expatriate_empl TO lt_employees.
*
*    LOOP AT lt_employees INTO DATA(lo_employee).
*      out->write( |Número de empleados: { lo_employee->get_employees_count( ) }| ).
*    ENDLOOP.


*** Polimorfismo con Clase
*    DATA: lt_organization TYPE STANDARD TABLE OF REF TO zcl_lab_29_organization_ranv.
*
*    DATA(lo_org_germany) = NEW zcl_lab_30_org_germany_ranv( ).
*    APPEND lo_org_germany TO lt_organization.
*
*    DATA(lo_org_france) = NEW zcl_lab_31_org_france_ranv( ).
*    APPEND lo_org_france TO lt_organization.
*
*
*    LOOP AT lt_organization INTO DATA(lo_organization).
*      out->write( lo_organization->get_location( ) ).
*    ENDLOOP.


*** Clases Abstractas
*    DATA(lo_logistics) = NEW zcl_lab_28_logistics_ranv( ).
*    out->write( lo_logistics->merchandise_output( ) ).
*    out->write( lo_logistics->production_line( ) ).
*    out->write( lo_logistics->input_products( ) ).



**** Alias
*    DATA(lo_flights) = NEW  zcl_lab_26_flights_ranv( ).
*    DATA(ls_airport) = lo_flights->get_airports( 'MIA' ).
*    out->write( |Airport ID: { ls_airport-airport_id }| ).
*    out->write( |City      : { ls_airport-city }| ).
*    out->write( |Name      : { ls_airport-name }| ).
*    out->write( |Coutry    : { ls_airport-country }| ).
*
*    DATA(ls_cust_address) = lo_flights->get_customer( '000003' ).
*    out->write( |First name: { ls_cust_address-first_name }| ).
*    out->write( |Last name : { ls_cust_address-last_name }| ).
*
*    lo_flights->set_conn_id( 'CONN_001' ).
*    out->write( lo_flights->get_conn_id( ) ).


**** Interfaces anidadas
*    DATA(lo_flights) = NEW  zcl_lab_26_flights_ranv( ).
*    DATA(ls_airport) = lo_flights->zif_lab_03_airports_ranv~get_airports( 'MIA' ).
*    out->write( |Airport ID: { ls_airport-airport_id }| ).
*    out->write( |City      : { ls_airport-city }| ).
*    out->write( |Name      : { ls_airport-name }| ).
*    out->write( |Coutry    : { ls_airport-country }| ).


**   Interfaces multiples
*    DATA(lo_flights) = NEW zcl_lab_26_flights_ranv( ).
*    DATA(ls_cust_address) = lo_flights->zif_lab_02_customer_ranv~get_customer( '000003' ).
*    out->write( |First name: { ls_cust_address-first_name }| ).
*    out->write( |Last name : { ls_cust_address-last_name }| ).

**** Interfaces
*    DATA(lo_flights) = NEW zcl_lab_26_flights_ranv(  ).
*    lo_flights->zif_lab_01_flight_ranv~set_conn_id( 'CONN_001' ).
*    out->write( lo_flights->zif_lab_01_flight_ranv~get_conn_id( ) ).


*** Herencia con clase amiga
*    DATA(lo_collaborator) = NEW zcl_lab_25_collaborator_ranv( ).
*    out->write( |Capital: { lo_collaborator->get_capital( ) }| ).


***** Clase Amiga
*    DATA(lo_partner) = NEW zcl_lab_24_partner_ranv( ).
*    out->write( |Capital: { lo_partner->get_company_capital( ) }| ).



**** Encapsulación de instancias
*    DATA(lo_student) = NEW zcl_lab_21_classroom_ranv( ).


**** Casting

**    Widening Cast
*    DATA: lo_lion_1 TYPE REF TO zcl_lab_19_lion_ranv,
*          lo_lion_2 TYPE REF TO zcl_lab_19_lion_ranv.
*
*    DATA: lo_animal TYPE REF TO zcl_lab_18_animal_ranv.
*
*    lo_lion_1 = NEW #( ).
*    lo_lion_2 = NEW #( ).
*    lo_animal = NEW #( ).
**    lo_animal = lo_lion_1.
*
*    TRY.
*        lo_lion_2 ?= lo_animal.
*      CATCH cx_sy_move_cast_error.
*        out->write( |Widening Cast error.| ).
*        RETURN.
*    ENDTRY.

*    out->write( |{ lo_lion_2->walk( ) }| ).


*    DATA(lo_animal) = NEW zcl_lab_18_animal_ranv( ).
*    DATA(lo_lion) = NEW zcl_lab_19_lion_ranv( ).
*
**   Narrowing Cast
*    lo_animal = lo_lion.
*    out->write( |{ lo_animal->walk( ) }| ).



**** Redefinición de metodos
*
*    DATA(lo_flight_price_1) = NEW zcl_lab_15_flight_price_ranv( ).
*    DATA(lo_price_discount_1) = NEW zcl_lab_16_price_discount_ranv( ).
*    DATA(lo_super_discount_1) = NEW zcl_lab_17_super_discount_ranv( ).
*
**  Price 1
*    SELECT *
*    FROM /dmo/flight
*    WHERE carrier_id    = 'SQ'
*    AND connection_id = '0001'
*    AND flight_date  = '20250903'
*    INTO @DATA(ls_price_1) UP TO 1 ROWS.
*    ENDSELECT.
*
*    IF sy-subrc EQ 0.
*
*      lo_flight_price_1->add_price( is_flight = ls_price_1 ).
*      lo_price_discount_1->add_price( is_flight =  ls_price_1 ).
*      lo_super_discount_1->add_price( is_flight =  ls_price_1 ).
*
*      out->write( |Price 1| ).
*      out->write( |Price         : { lo_flight_price_1->mt_flights[ 1 ]-price } { lo_flight_price_1->mt_flights[ 1 ]-currency_code }| ).
*      out->write( |Discount Price: { lo_price_discount_1->mt_flights[ 1 ]-price } { lo_flight_price_1->mt_flights[ 1 ]-currency_code }| ).
*      out->write( |Super Price   : { lo_super_discount_1->mt_flights[ 1 ]-price } { lo_flight_price_1->mt_flights[ 1 ]-currency_code }| ).
*
*    ENDIF.
*
*
*    DATA(lo_flight_price_2) = NEW zcl_lab_15_flight_price_ranv( ).
*    DATA(lo_price_discount_2) = NEW zcl_lab_16_price_discount_ranv( ).
*    DATA(lo_super_discount_2) = NEW zcl_lab_17_super_discount_ranv( ).
*
**   Price 2
*    SELECT *
*    FROM /dmo/flight
*    WHERE carrier_id    = 'UA'
*    AND connection_id = '0058'
*    AND flight_date  = '20250901'
*    INTO @DATA(ls_price_2) UP TO 1 ROWS.
*    ENDSELECT.
*
*    IF sy-subrc EQ 0.
*
*      lo_flight_price_2->add_price( is_flight = ls_price_2 ).
*      lo_price_discount_2->add_price( is_flight =  ls_price_2 ).
*      lo_super_discount_2->add_price( is_flight =  ls_price_2 ).
*
*      out->write( | | ).
*      out->write( |Price 2| ).
*      out->write( |Price         : { lo_flight_price_2->mt_flights[ 1 ]-price } { lo_flight_price_2->mt_flights[ 1 ]-currency_code }| ).
*      out->write( |Discount Price: { lo_price_discount_2->mt_flights[ 1 ]-price } { lo_flight_price_2->mt_flights[ 1 ]-currency_code }| ).
*      out->write( |Super Price   : { lo_super_discount_2->mt_flights[ 1 ]-price } { lo_flight_price_2->mt_flights[ 1 ]-currency_code }| ).
*
*    ENDIF.
*
*
*    DATA(lo_flight_price_3) = NEW zcl_lab_15_flight_price_ranv( ).
*    DATA(lo_price_discount_3) = NEW zcl_lab_16_price_discount_ranv( ).
*    DATA(lo_super_discount_3) = NEW zcl_lab_17_super_discount_ranv( ).
*
**   Price 3
*    SELECT *
*    FROM /dmo/flight
*    WHERE carrier_id    = 'AA'
*    AND connection_id = '0322'
*    AND flight_date  = '20250907'
*    INTO @DATA(ls_price_3) UP TO 1 ROWS.
*    ENDSELECT.
*
*    IF sy-subrc EQ 0.
*
*      lo_flight_price_3->add_price( is_flight = ls_price_3 ).
*      lo_price_discount_3->add_price( is_flight =  ls_price_3 ).
*      lo_super_discount_3->add_price( is_flight =  ls_price_3 ).
*
*      out->write( | | ).
*      out->write( |Price 3| ).
*      out->write( |Price         : { lo_flight_price_3->mt_flights[ 1 ]-price } { lo_flight_price_3->mt_flights[ 1 ]-currency_code }| ).
*      out->write( |Discount Price: { lo_price_discount_3->mt_flights[ 1 ]-price } { lo_flight_price_3->mt_flights[ 1 ]-currency_code }| ).
*      out->write( |Super Price   : { lo_super_discount_3->mt_flights[ 1 ]-price } { lo_flight_price_3->mt_flights[ 1 ]-currency_code }| ).
*
*    ENDIF.



*** Herencia

*    DATA(lo_linux) = NEW zcl_lab_12_linux_ranv( ).
*    lo_linux->get_architecture( IMPORTING ev_architecture = DATA(lv_architecture) ).
*    out->write( |Linux architecture: { lv_architecture }| ).

*   Cosntructor con herencia
*    DATA(lo_grid) = NEW zcl_lab_14_grid_ranv(
*      iv_view_type = 'VIEW_TYPE_1'
*      iv_box       = 'BOX_1'
*    ).
*
*    lo_grid->get_view_type( IMPORTING ev_view_type = DATA(lv_view_type) ).
*    lo_grid->get_box( IMPORTING ev_box = DATA(lv_box) ).
*    out->write( |{ lv_view_type } - { lv_box }| ).





*** Constructores

*    DATA(lo_constructor) = NEW zcl_lab_10_constructor_ranv( ).
*    out->write( zcl_lab_10_constructor_ranv=>log ).

*** Instancias
*    DATA: lo_person TYPE REF TO zcl_lab_04_person_ranv.
*
*    lo_person = NEW #( ).
*    IF lo_person IS BOUND.
*
*      lo_person->set_age( iv_age = 51 ).
*
*      lo_person->get_age(
*        IMPORTING
*          ev_age = DATA(lv_age)
*      ).
*
*      out->write( |Edad: { lv_age }| ).
*
*    ENDIF.
*
**   Instancia de la clase Flight
*    DATA(lo_flight) = NEW zcl_lab_05_flight_ranv( ).
*    IF lo_flight IS BOUND.
*
*      lo_flight->check_flight(
*        EXPORTING
*          iv_carrier_id    = 'AA'
*          iv_connection_id = '0320'
*        RECEIVING
*          rv_check         = DATA(lv_check)
*      ).
*
*      IF lv_check EQ abap_true.
*        out->write( 'Existe Conexión' ).
*      ELSE.
*        out->write( 'No existe Conexión' ).
*      ENDIF.
*
*    ENDIF.
*
**   Instancia de la clase Object
*    DATA(lo_object) = NEW zcl_lab_06_elements_ranv( ).
*    IF lo_object IS BOUND.
*
*      lo_object->set_object(
*        CHANGING
*          is_object = ms_object
*      ).
*
*      out->write( |{ ms_object-class }-{ ms_object-instance }-{ ms_object-reference }| ).
*    ENDIF.
*
*
**   Valores de constantes
*    out->write( |Pais  : { zcl_lab_06_elements_ranv=>c_pais }| ).
*    out->write( |Región: { zcl_lab_06_elements_ranv=>c_region }| ).
*    out->write( |Ciudad: { zcl_lab_06_elements_ranv=>c_ciudad }| ).
*    out->write( |Comuna: { zcl_lab_06_elements_ranv=>c_comuna }| ).
*
*
**   Instancia de la clase Student
*    DATA(lo_student) = NEW zcl_lab_07_student_ranv( ).
*
*    IF lo_student IS BOUND.
*
*      lo_student->set_birth_date( iv_birth_date = '19730513' ).
*
**      lo_student->birth_date = '19730513'.
*
*      out->write( |Fecha Nacimiento: { lo_student->birth_date }| ).
*    ENDIF.
*
*
**   Acceso a la clase Work Record
*
*    zcl_lab_08_work_record_ranv=>open_new_record(
*                                                  iv_date       = '20241228'
*                                                  iv_first_name = 'Raul'
*                                                  iv_last_name  = 'Nuñez'
**                                              iv_surname    =
*                                                ).
*
**   Instancia de la clase Account
*    DATA(lo_account) = NEW zcl_lab_09_account_ranv( ).
*    IF lo_account IS BOUND.
*
*      lo_account->set_iban( iban =  '123456' ).
*
*      lo_account->get_iban(
*        IMPORTING
*          iban = DATA(lv_iban)
*      ).
*
*      out->write( |IBAN: { lv_iban }| ).
*
*    ENDIF.

  ENDMETHOD.
ENDCLASS.
