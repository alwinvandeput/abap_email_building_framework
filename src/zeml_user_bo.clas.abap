CLASS zeml_user_bo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zeml_user_bo_ft.

  PUBLIC SECTION.

    INTERFACES zeml_country_settings_if .

    METHODS get_language_id
      RETURNING
        VALUE(rv_language_id) TYPE syst-langu.

  PROTECTED SECTION.

    DATA gv_user_name TYPE usr01-bname .

ENDCLASS.



CLASS ZEML_USER_BO IMPLEMENTATION.


  METHOD get_language_id.

    "----------------------------------------------
    "Read user language
    DATA ls_address TYPE bapiaddr3.
    DATA lt_return TYPE STANDARD TABLE OF bapiret2.

    CALL FUNCTION 'BAPI_USER_GET_DETAIL'
      EXPORTING
        username = CONV bapibname-bapibname( me->gv_user_name ) ##OPERATOR[BAPIBNAME]
      IMPORTING
        address  = ls_address
      TABLES
        return   = lt_return.

    IF ls_address-langu_p IS NOT INITIAL.

      rv_language_id = ls_address-langu_p.
      RETURN.

    ENDIF.

    "----------------------------------------------
    "Read default language
    DATA lv_parameter_name TYPE c LENGTH 60.
    DATA lv_parameter_value TYPE c LENGTH 60.

    lv_parameter_name = 'zcsa/system_language'.

    CALL 'C_SAPGPARAM' ID 'NAME'  FIELD lv_parameter_name
                       ID 'VALUE' FIELD lv_parameter_value.
    IF sy-subrc = 0.

      rv_language_id = lv_parameter_value.

    ENDIF.

  ENDMETHOD.


  METHOD zeml_country_settings_if~get_country_settings.

    SELECT SINGLE
        dcpfm AS number_format
        datfm AS date_format
        timefm AS time_format
      FROM usr01
      INTO rs_country_settings
      WHERE bname = gv_user_name.

    IF sy-subrc <> 0.

      "User name &1 has no user master record (USR01).
      RAISE EXCEPTION TYPE zcx_eml_return3
        MESSAGE e002
        WITH gv_user_name.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
