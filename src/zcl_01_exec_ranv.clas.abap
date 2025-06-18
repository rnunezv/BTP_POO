CLASS zcl_01_exec_ranv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_EXEC_RANV IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*** Patron de diseño Observer
    DATA(lo_processes) = NEW zcl_66_processes_ranv( ).
    DATA(lo_sales_dep) = NEW zcl_68_sales_dep_ranv( ).
    DATA(lo_billing_dep) = NEW zcl_69_billing_dep_ranv( ).

    SET HANDLER lo_sales_dep->on_modified_state FOR lo_processes.
    SET HANDLER lo_billing_dep->on_modified_state FOR lo_processes.

*   Set new state
    lo_processes->set_state( 'NEWSALE01 - Product 12345 - Laptop HP ' ).
    out->write( |Processes: { lo_processes->get_state( ) }| ).
    out->write( |Sales: { lo_sales_dep->state }| ).
    out->write( |Billing: { lo_billing_dep->state }| ).

    lo_processes->set_state( 'NEWSALE02 - Product 67890 - Laptop DELL ' ).
    out->write( |Processes: { lo_processes->get_state( ) }| ).
    out->write( |Sales: { lo_sales_dep->state }| ).
    out->write( |Billing: { lo_billing_dep->state }| ).



**** Patron de diseño Model-View-Controller
*    DATA: lv_name TYPE string VALUE 'Jhon Smith',
*          lv_role TYPE string VALUE 'Delevoper'.
*
*    DATA(lo_model) = NEW zcl_70_emp_model_ranv(
*                                                  iv_name = lv_name
*                                                  iv_role = lv_role
*                                                ).
*
*    DATA(lo_view) = NEW zcl_71_emp_view_ranv( ).
*
*    DATA(lo_controller) = NEW zcl_72_emp_controller_ranv( ).
*
*    lo_controller->set_model( lo_model ).
*    lo_controller->set_view( lo_view ).
*
*    lo_controller->get_view( )->display_employee(
*                                                  iv_name = lo_model->get_name( )
*                                                  iv_role = lo_model->get_role( )
*                                                  io_out  = out
*                                                ).



**** Patron de diseño Factory Method
*    DATA: lo_shape   TYPE REF TO zif_lab_11_geometric_figure_rn,
*          lo_factory TYPE REF TO zcl_62_factory_ranv.
*
*    lo_factory = NEW #( ).
*
*    lo_shape = lo_factory->get_shape( 'Circle' ).
*    out->write( lo_shape->draw_shape( ) ).
*
*    lo_shape = lo_factory->get_shape( 'Square' ).
*    out->write( lo_shape->draw_shape( ) ).
*
*    lo_shape = lo_factory->get_shape( 'Triangle' ).
*    out->write( lo_shape->draw_shape( ) ).


**** Patron de diseño Singleton
*    DATA: lo_singleton_1 TYPE REF TO zcl_58_singleton_ranv,
*          lo_singleton_2 TYPE REF TO zcl_58_singleton_ranv.
*
*
*    lo_singleton_1 = zcl_58_singleton_ranv=>get_instance( ).
*
*    WAIT UP TO 2 SECONDS.
*
*    lo_singleton_2 = zcl_58_singleton_ranv=>get_instance( ).
*
*    out->write( lo_singleton_1->mv_time ).
*    out->write( lo_singleton_2->mv_time ).
*
**   Se modifica la hora para una de las referencias
*    out->write( cl_abap_char_utilities=>newline ).
*
*    lo_singleton_1->mv_time = cl_abap_context_info=>get_system_time( ).
*
*    out->write( lo_singleton_1->mv_time ).
*    out->write( lo_singleton_2->mv_time ).



**** Clase gobal de test
*    DATA(lo_business_pr) = NEW zcl_55_business_pr_ranv( ).
*
*    lo_business_pr->get_factorial(
*      EXPORTING
*        iv_number    = 4
*      IMPORTING
*        ev_factorial = DATA(lv_factorial)
*    ).
*
*    out->write( |4! = { lv_factorial }| ).


**** Asignacion de excepciones unas a otras
*    DATA(lo_excecution) = NEW zcx_54_excecution_ranv( ).
*
*
*    TRY.
*        TRY.
*            TRY.
*
*                lo_excecution->raise_exception1( ).
*              CATCH zcx_51_exception1_ranv INTO DATA(lx_exception1).
*                lo_excecution->raise_exception2( io_previous = lx_exception1 ).
*
*            ENDTRY.
*
*          CATCH zcx_52_exception2_ranv INTO DATA(lx_exception2).
*            lo_excecution->raise_exception3( io_previous = lx_exception2 ).
*
*        ENDTRY.
*
*      CATCH zcx_53_exception3_ranv INTO DATA(lx_exception3).
*
*        IF lx_exception3 IS BOUND.
*          out->write( |Ref3: { lx_exception3->get_text( ) } { cl_abap_char_utilities=>newline }| ).
*        ENDIF.
*
*        IF lx_exception3->previous IS BOUND.
*          out->write( |Ref2: { lx_exception3->previous->get_text( ) } { cl_abap_char_utilities=>newline }| ).
*        ENDIF.
*
*        IF lx_exception3->previous->previous IS BOUND.
*          out->write( |Ref1: { lx_exception3->previous->previous->get_text( ) } { cl_abap_char_utilities=>newline }| ).
*        ENDIF.
*
*        IF lx_exception3->previous->previous->previous IS BOUND.
*          out->write( |Ref0: { lx_exception3->previous->previous->previous->get_text( ) } { cl_abap_char_utilities=>newline }| ).
*        ENDIF.
*
*    ENDTRY.




**** Execepciones Reanudables
*
*    DATA(lo_atm) = NEW zcl_50_atm_ranv( ).
*
** Case 1: Expired Credit Card
*    out->write( 'Case 1: Expired Credit Card' ).
*
*    out->write( lo_atm->withdraw_money(
*      EXPORTING
*        iv_card            = '1111 2222 3333 4444'
*        iv_amount          = 30 ) ).
*
*
** Case 2: Insufficient balance in the current account
*    out->write( 'Case 2: Insufficient balance in the current account' ).
*
*    out->write( lo_atm->withdraw_money(
*  EXPORTING
*    iv_card            = '1111 2222 3333 5555'
*    iv_amount          = 100 ) ).
*
*
** Case 3: Withdraw money form the savings account
*    out->write( 'Case 3: Withdraw money form the savings account' ).
*
*    out->write( lo_atm->withdraw_money(
*  EXPORTING
*    iv_card            = '1111 2222 3333 5555'
*    iv_amount          = 100
*    iv_savings_account = abap_true ) ).





**** Ejercicio CLEANUP
*    DATA:lv_result TYPE i,
*         lv_num1   TYPE i VALUE 10,
*         lv_num2   TYPE i.
*
*    TRY.
*        TRY.
*
*            lv_result = lv_num1 + lv_num2.
*            lv_result = lv_num1 / lv_num2.
*            lv_result = lv_num1 - lv_num2.
*
*          CATCH zcx_lab_52_operations_ranv INTO DATA(lx_auth).
*            out->write( lx_auth->get_text( ) ).
*
*          CLEANUP INTO DATA(lx_cleanup).
*            out->write( |Cleanup 1.... Result: { lv_result }| ).
*            out->write( |Message Cleanup: { lx_cleanup->get_text( ) }| ).
*
*        ENDTRY.
*
*      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).
*        out->write( lx_zerodivide->get_text( ) ).
*        lv_num2 = 2.
*        RETRY.
*
*      CLEANUP.
*        out->write( |Cleanup 2| ).
*
*    ENDTRY.
*
*    out->write( |FINISH: { lv_result }| ).



**** CLEANUP
*    DATA:lv_result TYPE i,
*         lv_num1   TYPE i VALUE 10,
*         lv_num2   TYPE i.
*
*    TRY.
*        TRY.
*
*            lv_result = lv_num1 + lv_num2.
*            lv_result = lv_num1 / lv_num2.
*            lv_result = lv_num1 - lv_num2.
*
*          CATCH zcx_45_auth_ranv INTO DATA(lx_auth).
*            out->write( lx_auth->get_text( ) ).
*
*          CLEANUP.
*            out->write( |Cleanup 1.... Result: { lv_result }| ).
*
*        ENDTRY.
*
*      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).
*        out->write( lx_zerodivide->get_text( ) ).
*        lv_num2 = 2.
*        RETRY.
*
*      CLEANUP.
*        out->write( |Cleanup 2| ).
*
*    ENDTRY.
*
*    out->write( |FINISH: { lv_result }| ).


**** Granularidad
*    DATA(lo_manage_cntr) = NEW zcl_46_manage_cntr_ranv( ).
*
*    DATA:lv_result TYPE i,
*         lv_num1   TYPE i VALUE 10,
*         lv_num2   TYPE i.
*
*
*    TRY.
**        lo_manage_cntr->check_user( sy-uname ).
*
*        lv_result = lv_num1 / lv_num2.
*
*      CATCH zcx_45_auth_ranv INTO DATA(lx_auth).
*        out->write( lx_auth->get_text( ) ).
*
*      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).
*        out->write( lx_zerodivide->get_text( ) ).
*        lv_num2 = 2.
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
*    out->write( |FINISH: { lv_result }| ).



**** RETRY
*    DATA(lo_manage_cntr) = NEW zcl_46_manage_cntr_ranv( ).
*
*    DATA:lv_result TYPE i,
*         lv_num1   TYPE i VALUE 10,
*         lv_num2   TYPE i.
*
*
*    TRY.
**        lo_manage_cntr->check_user( sy-uname ).
*
*        lv_result = lv_num1 / lv_num2.
*
*      CATCH zcx_45_auth_ranv INTO DATA(lx_auth).
*        out->write( lx_auth->get_text( ) ).
*
*      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).
*        out->write( lx_zerodivide->get_text( ) ).
*        lv_num2 = 2.
*        RETRY.
*    ENDTRY.
*
*    out->write( |FINISH: { lv_result }| ).



**** Exceptions - TRY_CATCH-ENTRY
*    DATA(lo_manage_cntr) = NEW zcl_46_manage_cntr_ranv( ).
*
*
*    TRY.
*        lo_manage_cntr->check_user( sy-uname ).
*
*      CATCH zcx_45_auth_ranv INTO DATA(lx_auth).
*        out->write( lx_auth->get_text( ) ).
*    ENDTRY.



**** Class-relevant Local Types
*    DATA(lo_components) = NEW zcl_43_components_ranv( ).
*    lo_components->get_first( IMPORTING ev_first = DATA(lv_first) ).


** Manejar eventos para todas las instancias de la clase
*    DATA(lo_north_building) = NEW zcl_41_building_ranv( ).
*    DATA(lo_south_building) = NEW zcl_41_building_ranv( ).
*    DATA(lo_east_building) = NEW zcl_41_building_ranv( ).
*    DATA(lo_west_building) = NEW zcl_41_building_ranv( ).
*
*    DATA(lo_access) = NEW zcl_42_access_ranv( ).
*
**    SET HANDLER lo_access->on_blocked_entrance FOR lo_north_building.
**    SET HANDLER lo_access->on_blocked_entrance FOR lo_south_building.
**    SET HANDLER lo_access->on_blocked_entrance FOR lo_east_building.
**    SET HANDLER lo_access->on_blocked_entrance FOR lo_west_building.
*
**    SET HANDLER lo_access->on_blocked_entrance FOR ALL INSTANCES.
*
*
*    lo_north_building->entry = |North|.
*    lo_north_building->close_entry( ).
*
*    lo_south_building->entry = |South|.
*    lo_south_building->close_entry( ).
*
*    lo_east_building->entry = |East|.
*    lo_east_building->close_entry( ).
*
*    lo_west_building->entry = |West|.
*    lo_west_building->close_entry( ).
*
*
*    out->write( zcl_42_access_ranv=>table_blocked_entries ).


**** Eventos estaticos
*
*    SET HANDLER zcl_40_smtp_ranv=>on_new_mail.
*
*    DO 3 TIMES.
*
*      WAIT UP TO 1 SECONDS.
*      zcl_39_mail_ranv=>compose_mail( ).
*
*    ENDDO.
*
*    out->write( zcl_40_smtp_ranv=>table_inbox ).


**** Desactivar Objeto manejador
*    DATA(lo_americanbank) = NEW zcl_37_americanbank_ranv( ).
*    DATA(lo_bankclient) = NEW zcl_38_bankclient_ranv( ).
*
*    SET HANDLER  lo_bankclient->on_new_transfer FOR lo_americanbank ACTIVATION abap_true.
*
*    DO 5 TIMES.
*
*      WAIT UP TO 1 SECONDS.
*
*      out->write( lo_americanbank->create_notification( ) ).
*      out->write( lo_bankclient->notification ) .
*
*      IF sy-index EQ 3.
*        SET HANDLER  lo_bankclient->on_new_transfer FOR lo_americanbank ACTIVATION abap_false.
*        lo_bankclient->notification = |No handler for event new transfer|.
*      ENDIF.
*
*    ENDDO.




**** Definir Eventos en las interfaces
*    DATA(lo_americanbank) = NEW zcl_37_americanbank_ranv( ).
*    DATA(lo_bankclient) = NEW zcl_38_bankclient_ranv( ).
*
*    SET HANDLER  lo_bankclient->on_new_transfer FOR lo_americanbank.
*
*    DO 5 TIMES.
*
*      WAIT UP TO 1 SECONDS.
*
*      out->write( lo_americanbank->create_notification( ) ).
*      out->write( lo_bankclient->notification ) .
*
*    ENDDO.


**** Establecer referencia Manejadora
*    DATA(lo_timer) = NEW zcl_35_timer_ranv( ).
*    DATA(lo_conexion) = NEW zcl_36_conexion_ranv( ).
*
*    SET HANDLER lo_conexion->on_time_out FOR lo_timer.
*
*    DO.
*
*      WAIT UP TO 1 SECONDS.
*
*      lo_timer->increment_counter( 1 ).
*
*      IF lo_conexion->hour IS INITIAL.
*        out->write( |Event not yet executed: { cl_abap_context_info=>get_system_time( ) }| ).
*      ELSE.
*        out->write( |Event was raised at: { lo_conexion->hour } - { lo_conexion->sender_user }| ).
*        EXIT.
*      ENDIF.
*
*    ENDDO.


**** Asignar instancias utilizando la clase generica OBJECT
*    DATA lo_object TYPE REF TO object.
*
*    lo_object = NEW zcl_34_product_ranv( ).
*    DATA(lv_method_name) = 'RETURN_CATEGORY'.
*
*    DATA lv_category TYPE string.
*    CALL METHOD lo_object->(lv_method_name) RECEIVING rv_category = lv_category.
*
*    out->write( lv_category ).


**** Instancias de tipos distintos
*    DATA: lo_contract TYPE REF TO zif_09_contract_ranv.
*
*    lo_contract = NEW zcl_32_constr_cntr_ranv( ).
*    CREATE OBJECT lo_contract TYPE zcl_32_constr_cntr_ranv.
*
*    DATA lo_constr_cntr TYPE REF TO zcl_32_constr_cntr_ranv.
*    lo_constr_cntr = NEW zcl_33_record_ranv( ).
*
*    lo_contract = NEW zcl_33_record_ranv( ).


**** Multiples referencias
*    DATA: lo_vat_indicator_1 TYPE REF TO zcl_31_vat_indicator_ranv,
*          lo_vat_indicator_2 TYPE REF TO zcl_31_vat_indicator_ranv,
*          lo_vat_indicator_3 TYPE REF TO zcl_31_vat_indicator_ranv.
*
*    lo_vat_indicator_1 = NEW #( ).
*    lo_vat_indicator_2 = NEW #( ).
*    lo_vat_indicator_3 = NEW #( ).
*
*    lo_vat_indicator_2 = lo_vat_indicator_1.
*    lo_vat_indicator_3 = lo_vat_indicator_1.
*
*    lo_vat_indicator_1->vat_indicator = 'A1'.
*    lo_vat_indicator_2->vat_indicator = 'A2'.
*    lo_vat_indicator_3->vat_indicator = 'A3'.
*
*    out->write( lo_vat_indicator_1->vat_indicator ).
*    out->write( lo_vat_indicator_2->vat_indicator ).
*    out->write( lo_vat_indicator_3->vat_indicator ).





**** Composición
*    DATA(lo_keyboard) = NEW zcl_29_keyboard_ranv( ).
*    DATA(lo_laptop)   = NEW zcl_30_laptop_ranv( lo_keyboard ).
*
*    lo_keyboard->keyboard_type = 'ES'.
*    out->write( lo_laptop->keyboard->keyboard_type ).



**** Asociacion
*    DATA(lo_credit_card) = NEW zcl_27_credit_card_ranv( ).
*    DATA(lo_client)      = NEW zcl_28_client_ranv( ).
*
*    lo_credit_card->set_card_num( '1111 2222 3333 4444' ).
*    lo_client->set_credit_card( lo_credit_card ).
*    out->write( lo_client->get_credit_card( )->get_card_num( ) ).

**** Polimorfismo con interfaces
*    DATA: lt_companies   TYPE STANDARD TABLE OF REF TO zif_08_co_company_ranv,
*          lo_co_company  TYPE REF TO zif_08_co_company_ranv,
*          lo_company_eu  TYPE REF TO zcl_24_company_eu_ranv,
*          lo_company_usa TYPE REF TO zcl_25_company_usa_ranv,
*          lo_plant       TYPE REF TO zcl_26_plant_ranv.
*
*
*    lo_company_eu = NEW #( ).
*    APPEND lo_company_eu TO lt_companies.
*
*    lo_company_usa = NEW #( ).
*    APPEND lo_company_usa TO lt_companies.
*
*    lo_plant = NEW #( ).
*
*    LOOP AT lt_companies INTO lo_co_company.
*      out->write( lo_co_company->define_company( ) ).
*      out->write( lo_plant->assign_company( lo_co_company ) ).
*    ENDLOOP.


**** Polimorfismo con clases
*
*    DATA: gt_airplane        TYPE STANDARD TABLE OF REF TO zcl_21_airplane_ranv,
*          go_airplane        TYPE REF TO zcl_21_airplane_ranv,
*          go_cargo_plane     TYPE REF TO zcl_22_cargo_plane_ranv,
*          go_passenger_plane TYPE REF TO zcl_23_passenger_plane_ranv.
*
*
*    go_cargo_plane = NEW #( ).
*    APPEND go_cargo_plane TO gt_airplane.
*
*    go_passenger_plane = NEW #( ).
*    APPEND go_passenger_plane TO gt_airplane.
*
*
*    LOOP AT gt_airplane INTO go_airplane.
*      out->write( go_airplane->airplane_type( ) ).
*    ENDLOOP.



**   Aliases
*    DATA(lo_bp) = NEW zcl_017_bp_ranv( ).
*    lo_bp->zif_07_company_ranv~set_company_type( ).
*    lo_bp->set_company_type( ).
*
*    lo_bp->zif_06_group_ranv~set_group( ).
*    lo_bp->zif_07_company_ranv~group( ).


**** Interfaces anidadas
*    DATA(lo_sales_department) = NEW zcl_16_sales_department_ranv( ).
*    lo_sales_department->zif_04_document_ranv~set_sales_doc( '123D' ).
*    lo_sales_department->zif_05_sales_order_ranv~create_order( '123O' ).


**** Interfaces multiples
*    DATA(lo_screen) = NEW zcl_15_screen_ranv( 22 ).
*    out->write( lo_screen->zif_03_en_unit_ranv~dimensions_inches( ) ).
*    out->write( lo_screen->zif_02_eu_unit_ranv~dimensions_centimeter( ) ).


*** Interfaces
*    DATA(lo_travel_agency) = NEW zcl_14_travel_agency_ranv( ).
*    lo_travel_agency->zif_01_agency_ranv~set_name( 'Gate2Fly.com' ).
*    out->write( lo_travel_agency->zif_01_agency_ranv~get_name( ) ).
*
*    zcl_14_travel_agency_ranv=>zif_01_agency_ranv~set_address( 'Santiago, Chile' ).
*    out->write( zcl_14_travel_agency_ranv=>zif_01_agency_ranv~agency_address ).


*** Encapsulación de instancias
*    DATA(lo_citizen) = NEW zcl_09_citizen_ranv( ).


*** Casting ********************************************************************
*    DATA(lo_animal) = NEW zcl_07_animal_ranv( ).
*    DATA(lo_lion)   = NEW zcl_08_lion_ranv( ).
*
*    out->write( |Animal - { lo_animal->walk( ) }| ).
*    out->write( |Lion - { lo_lion->walk( ) }| ).
*
*    out->write( | | ).
*
*    lo_animal = lo_lion.
*    out->write( |Narrowing Casting - Up Cast| ).
*    out->write( |Animal - { lo_animal->walk( ) }| ).
*    out->write( |Lion - { lo_lion->walk( ) }| ).
*
*    TRY.
*        lo_lion ?= lo_animal.
*      CATCH cx_sy_move_cast_error .
*        out->write( |Widening Cast error.| ).
*        RETURN.
*    ENDTRY.
*
*    out->write( | | ).
*
*    out->write( |Widening Casting - Down Cast| ).
*    out->write( |Animal - { lo_animal->walk( ) }| ).
*    out->write( |Lion - { lo_lion->walk( ) }| ).



**** Herencia ********************************************************************
*
*    DATA(lo_company) = NEW zcl_04_company_ranv( iv_quotation = 'Q1' ).
*    DATA(lo_plant)   = NEW zcl_05_plant_ranv( iv_quotation = 'Q2' iv_product = 'P2' ).
*    DATA(lo_storage) = NEW zcl_06_storage_ranv( iv_quotation = 'Q3' iv_product = 'P3' ).
*
*    lo_company->set_company_code( iv_company_code = '1234' ).
*    lo_company->set_currency( iv_currency = 'USD' ).
*    lo_company->get_company_code( IMPORTING ev_company_code = DATA(lv_company_code) ).
*    lo_company->get_currency( IMPORTING ev_currency = DATA(lv_currency) ).
*    out->write( |Company { lv_company_code }-{ lv_currency }-{ lo_company->quotation }| ).
*
*    lo_plant->set_company_code( iv_company_code = '5678' ).
*    lo_plant->set_currency( iv_currency = 'EUR' ).
*    lo_plant->get_company_code( IMPORTING ev_company_code = lv_company_code ).
*    lo_plant->get_currency( IMPORTING ev_currency = lv_currency ).
*    out->write( |Plant { lv_company_code }-{ lv_currency }-{ lo_plant->quotation }-{ lo_plant->product }| ).
*
*    lo_storage->set_company_code( iv_company_code = '9012' ).
*    lo_storage->set_currency( iv_currency = 'CAD' ).
*    lo_storage->get_company_code( IMPORTING ev_company_code = lv_company_code ).
*    lo_storage->get_currency( IMPORTING ev_currency = lv_currency ).
*    out->write( |Storage { lv_company_code }-{ lv_currency }-{ lo_storage->quotation }-{ lo_storage->product }| ).



*** Constructores ****************************************************************
*    out->write( zcl_03_employee_ranv=>log ).
*
*    DATA(lo_employee1) = NEW zcl_03_employee_ranv( iv_employee_id = '01' ).
**    out->write( lo_employee1->get_employee_id( ) ).
*    out->write( zcl_03_employee_ranv=>log ).
*
*    DATA(lo_employee2) = NEW zcl_03_employee_ranv( iv_employee_id = '02' ).
**    out->write( lo_employee2->get_employee_id( ) ).
*    out->write( zcl_03_employee_ranv=>log ).

*    out->write( zcl_03_employee_ranv=>company ).


**********************************************************************************

*    DATA lv_process TYPE string.
*    DATA: lt_adrress TYPE zcl_02_contract_ranv=>tty_address,
*          ls_address TYPE zcl_02_contract_ranv=>ty_address.
*
*
**   Acceso a miembros de instancia
**    DATA(lo_contract) = NEW zcl_02_contract_ranv( ).
*
*    zcl_02_contract_ranv=>get_instance( IMPORTING er_instance = DATA(lo_contract) ).
*
*    IF lo_contract IS BOUND.
*
*      lo_contract->set_client(
*        EXPORTING
*          iv_client   = 'Logali'
**          iv_location = space
*        IMPORTING
*          ev_status   = DATA(lv_status)
*        CHANGING
*          cv_process  = lv_process
*      ).
*
*      lo_contract->get_client(
*        IMPORTING
*          ev_client = DATA(lv_client)
*      ).
*
*      lo_contract->region = 'LA'.
*
**     Llamada a metodo funcional
*      DATA(lv_client_name) = lo_contract->get_client_name( iv_client_id = '01' ).
*      IF lo_contract->get_client_name( iv_client_id = '01' ) IS NOT INITIAL.
*        out->write( lo_contract->get_client_name( iv_client_id = '01' ) ).
*      ENDIF.
*
*    ENDIF.
*
*
**   Acceso a miembros Estaticos
*    zcl_02_contract_ranv=>set_cntr_type( 'Construction' ).
*    zcl_02_contract_ranv=>get_cntr_type(
*      IMPORTING
*        ev_cntr_type = DATA(lv_cntr_type)
*    ).
*
*    zcl_02_contract_ranv=>currency = zcl_02_contract_ranv=>cs_currency-usd.
*
*    out->write( zcl_02_contract_ranv=>currency ).
*    out->write( |{ lv_client }-{ lv_status }-{ lv_process }-{ lo_contract->region }| ).
*    out->write( lv_cntr_type ).
*
**    zcl_02_contract_ranv=>company = ''.
*    out->write( |Company: { zcl_02_contract_ranv=>company }| ).

  ENDMETHOD.
ENDCLASS.
