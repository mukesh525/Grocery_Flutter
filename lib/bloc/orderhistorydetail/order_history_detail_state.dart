import 'package:grocery/model/orderhistorydetail/order_history_detail.dart';
import 'package:meta/meta.dart';

class OrderHistoryDetailState {
  bool loading;
  final List<OrderHistoryDetail> orderHistoryDetailList;

  OrderHistoryDetailState(
      {@required this.loading,
      this.orderHistoryDetailList});

  factory OrderHistoryDetailState.initial() {
    return OrderHistoryDetailState(
        loading: false,
        orderHistoryDetailList: List());
  }

  OrderHistoryDetailState copyWith(
      {bool loading,
      List<OrderHistoryDetail> orderHistoryDetailList}) {
    return OrderHistoryDetailState(
        loading: loading ?? this.loading,
        orderHistoryDetailList:
        orderHistoryDetailList ?? this.orderHistoryDetailList);
  }
}
