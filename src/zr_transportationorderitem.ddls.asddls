@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Transportation Order Item'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_TransportationOrderItem
  as select from I_TransportationOrderItem
  association to parent ZR_TransportationOrder as _TransportationOrder on $projection.TransportationOrderUUID = _TransportationOrder.TransportationOrderUUID
{
  key TransportationOrderItemUUID,
      TransportationOrderUUID,
      TranspOrdItem,
//      TranspOrdItemType,
      IsMultiItem,
      TranspOrdItemParentItemUUID,
      SourceStopUUID,
      DestinationStopUUID,
      TranspOrdItemDesc,
      TranspOrdItemCategory,
      IsMainCargoItem,
      PredecessorTransportationOrder,
      Shipper,
      Consignee,
      TransportationMode,
      TransportationModeCategory,
      MeansOfTransport,

      _TransportationOrder
}
