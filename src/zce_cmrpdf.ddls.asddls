@EndUserText.label: 'CMR PDF entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_TM_PDF'
define custom entity ZCE_CMRPDF
  //  with parameters
  //    IV_TOUUID : /scmtms/vdm_tor_db_key
{
  key TransportationOrderUUID : /scmtms/vdm_tor_db_key;
      @Semantics.mimeType     : true
      MimeType                : abap.char(128);

      @UI.hidden              : true
      FileName                : abap.char(128);

      @Semantics.largeObject  : {
        mimeType              : 'MimeType',
        fileName              : 'FileName',
        contentDispositionPreference: #INLINE
      }
      PDFContent              : abap.rawstring(0);

}
