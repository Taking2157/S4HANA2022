@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Transportation Order'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_TransportationOrder
  as select from I_TransportationOrder
  composition [0..*] of ZR_TransportationOrderItem as _Items
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

      _Items
}
