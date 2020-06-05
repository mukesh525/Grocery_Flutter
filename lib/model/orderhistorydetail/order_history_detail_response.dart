import 'order_history_detail.dart';

class OrderHistoryDetailResponse
{
   final int status;
   final String message;
   final List<OrderHistoryDetail> orderHistoryDetailList;

   OrderHistoryDetailResponse({this.status, this.message, this.orderHistoryDetailList});
}