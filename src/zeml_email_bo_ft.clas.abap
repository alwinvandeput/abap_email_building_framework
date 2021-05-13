CLASS zeml_email_bo_ft DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get_factory
      RETURNING
        VALUE(rr_factory) TYPE REF TO zeml_email_bo_ft.

    CLASS-METHODS set_factory
      IMPORTING ir_factory TYPE REF TO zeml_email_bo_ft.

    METHODS create_email
      IMPORTING
        is_email_data      TYPE zeml_email_bo=>gts_data
      RETURNING
        VALUE(rr_email_bo) TYPE REF TO zeml_email_bo.

  PROTECTED SECTION.

    CLASS-DATA gr_factory TYPE REF TO zeml_email_bo_ft .

  PRIVATE SECTION.

ENDCLASS.



CLASS zeml_email_bo_ft IMPLEMENTATION.


  METHOD create_email.

    rr_email_bo = NEW #( ).

    rr_email_bo->gs_data = is_email_data.

  ENDMETHOD.


  METHOD get_factory.

    IF gr_factory IS NOT INITIAL.

      rr_factory = gr_factory.

      RETURN.

    ENDIF.

    rr_factory = NEW #( ).

  ENDMETHOD.


  METHOD set_factory.

    gr_factory = ir_factory.

  ENDMETHOD.

ENDCLASS.
