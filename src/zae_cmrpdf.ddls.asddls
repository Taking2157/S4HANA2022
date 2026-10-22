@EndUserText.label: 'Abstract Entity CMR PDF'
define abstract entity ZAE_CMRPDF
{
  key TransportationOrderUUID : /scmtms/vdm_tor_db_key;
      @UI.hidden              : true
      MimeType                : abap.char(128);

      @UI.hidden              : true
      FileName                : abap.char(128);

      @Semantics.largeObject  : {
        mimeType              : 'MimeType',
        fileName              : 'FileName',
        contentDispositionPreference: #INLINE
      }
      PDFContent              : abap.rawstring;

}
