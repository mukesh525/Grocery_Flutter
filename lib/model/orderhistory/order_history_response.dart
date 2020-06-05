import 'order_history_item.dart';

class OrderHistoryResponse
{
   final int status;
   final String message;
   final List<OrderHistoryItem> orderHistoryItemList;

   OrderHistoryResponse({this.status, this.message, this.orderHistoryItemList});
}