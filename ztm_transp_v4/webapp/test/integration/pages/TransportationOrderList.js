sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'ztaking.ztmtranspv4',
            componentId: 'TransportationOrderList',
            contextPath: '/TransportationOrder'
        },
        CustomPageDefinitions
    );
});