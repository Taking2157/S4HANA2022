sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ztaking/ztmtranspv4/test/integration/pages/TransportationOrderList",
	"ztaking/ztmtranspv4/test/integration/pages/TransportationOrderObjectPage"
], function (JourneyRunner, TransportationOrderList, TransportationOrderObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ztaking/ztmtranspv4') + '/test/flp.html#app-preview',
        pages: {
			onTheTransportationOrderList: TransportationOrderList,
			onTheTransportationOrderObjectPage: TransportationOrderObjectPage
        },
        async: true
    });

    return runner;
});

