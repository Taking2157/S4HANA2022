@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Consump Transportation Order Item'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_TransportationOrderItem
  provider contract transactional_query
  as projection on ZR_TransportationOrderItem
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
      /* Associations */
      _TransportationOrder
}
