CLASS zcl_tm_pdf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .

    TYPES:BEGIN OF ty_cmr_pdf,
	  transportationorderuuid TYPE /scmtms/vdm_tor_db_key,
	  mimetype TYPE string,
	  filename TYPE string,
	  pdfcontent TYPE xstring,
	END OF ty_cmr_pdf.

    TYPES tt_cmr_pdf TYPE TABLE OF ty_cmr_pdf .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tm_pdf IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    DATA(lt_params) = io_request->get_parameters( ).
    DATA(lt_filters) = io_request->get_filter( )->get_as_ranges( ).

    DATA(lv_db_key) = value #( lt_filters[ 1 ]-range[ 1 ]-low OPTIONAL ).

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

    DATA lt_result TYPE tt_cmr_pdf.

    DATA(result) = VALUE ty_cmr_pdf(
        transportationorderuuid = lv_db_key
        mimetype = if_rest_media_type=>gc_appl_pdf
        filename = |{ lv_db_key }.pdf|
        pdfcontent = es_formoutput-pdf ).

    lt_result = VALUE #( ( result ) ).

    io_response->set_data( lt_result ).
    io_response->set_total_number_of_records( lines( lt_result ) ).

  ENDMETHOD.
ENDCLASS.
