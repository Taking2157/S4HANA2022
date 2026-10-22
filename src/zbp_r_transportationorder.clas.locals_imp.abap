CLASS lhc_transportationorder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR transportationorder RESULT result.

    METHODS read FOR READ
      IMPORTING keys FOR READ transportationorder RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK transportationorder.

    METHODS previewpdf FOR MODIFY
      IMPORTING keys FOR ACTION transportationorder~previewpdf RESULT result.

ENDCLASS.

CLASS lhc_transportationorder IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD previewpdf.
    "0A7C457F45501ED993846982D0F1E52E
    DATA(lv_db_key) = keys[ 1 ]-transportationorderuuid.

    "1.先假设用FO
    DATA:
      lo_printout        TYPE REF TO  /scmtms/cl_printout,
      lt_keys            TYPE /bobf/t_frw_key,
      ip_function_name   TYPE rs38l_fnam,
      ip_form_name       TYPE fpname,
      is_outputparams    TYPE sfpoutputparams,

      es_formoutput      TYPE fpformoutput,
      es_joboutput       TYPE sfpjoboutput,
      lo_message         TYPE REF TO  /bobf/if_frw_message,
      ev_document_number TYPE ppfdsort,

      cs_docparams       TYPE sfpdocparams,
      cp_document_title  TYPE string.

    ip_function_name = '/1BCDWB/SM00000270'.
    ip_form_name = 'ZI2O_SCMTMS_FP_CMR'.
    is_outputparams = VALUE #(
      preview  = abap_true
      nodialog = abap_true
*      getpdf   = abap_false
*      getxml   = abap_false
      getpdf   = abap_true
      getxml   = abap_true
    ).

    CREATE OBJECT lo_printout TYPE zcl_tm_printout_test.
*    CREATE OBJECT lo_printout TYPE /scmtms/cl_printout_load_plan.

    lt_keys = VALUE #(
        ( key = lv_db_key )
    ).

    IF lo_printout IS BOUND.
*   Fill data and print document.
      CALL METHOD lo_printout->print_document
        EXPORTING
          it_keys            = lt_keys
          ip_function_name   = ip_function_name
          ip_form_name       = ip_form_name
          is_outputparams    = is_outputparams
        IMPORTING
          es_formoutput      = es_formoutput
          es_joboutput       = es_joboutput
          eo_message         = lo_message
          ev_document_number = ev_document_number
        CHANGING
          cs_docparams       = cs_docparams
          cp_document_title  = cp_document_title.
    ENDIF.

    result = VALUE #( ( transportationorderuuid = lv_db_key
					  %param = VALUE #(
					   transportationorderuuid = lv_db_key
					   mimetype = if_rest_media_type=>gc_appl_pdf
					   filename = |{ lv_db_key }.pdf|
					   pdfcontent = es_formoutput-pdf
					  ) ) ).

  ENDMETHOD.

ENDCLASS.

CLASS lsc_zr_transportationorder DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zr_transportationorder IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
