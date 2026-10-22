sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox",
    "sap/m/PDFViewer"
], function (MessageToast, MessageBox, PDFViewer) {
    'use strict';

    return {
        PreviewPDF: function (oEvent) {
            var oView = this.getView();
            var oContext = oView.getBindingContext();
            var oModel = oView.getModel();

            if (!oContext) {
                MessageBox.error("无法取得当前运输订单");
                return;
            }

            var sDbKey =
                oContext.getProperty("TransportationOrderUUID");

            oView.setBusy(true, 1000);

            /*
             * /PreviewPDF 只是示例。
             * 必须在 $metadata 中确认。
             */

            oView.setBusy(false);

            if (!this._oPDFViewer) {
                this._oPDFViewer = new PDFViewer({
                    isTrustedSource: true
                });

                oView.addDependent(this._oPDFViewer);
            }

            this._oPDFViewer.setTitle(
                "PDF预览"
            );
            
            var sUrl = oModel.sServiceUrl


            this._oPDFViewer.setSource(`${ sUrl }/CMRPDF(TransportationOrderUUID=guid'${ sDbKey }')/$value`)
            this._oPDFViewer.open();
        }
    }
});
