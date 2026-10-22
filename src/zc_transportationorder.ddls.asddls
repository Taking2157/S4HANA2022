@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Consumption Transportation Order'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_TransportationOrder
  provider contract transactional_query
  as projection on ZR_TransportationOrder
{
  key TransportationOrderUUID,
      TransportationOrder,
      TransportationOrderCategory,
      //      TransportationOrderType,
      DangerousGoodsAreContained,
      //      TransportationServiceLevel,
      TranspOrdResponsiblePerson,
      TranspOrdPartnerReference,
      MasterBillOfLading,
      TranspOrdPlanningBlock,
      TranspOrdExecutionIsBlocked,
      InvoicingIsBlocked,
      CarrierUUID,
      Carrier,
      /* Associations */
      _Items
}
