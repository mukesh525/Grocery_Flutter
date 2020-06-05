import 'package:grocery/model/orderhistory/order_history_item.dart';
import 'package:meta/meta.dart';

class OrderHistoryState {
  bool loading;
  final String search, userId;
  final List<OrderHistoryItem> orderHistoryItemList;

  OrderHistoryState(
      {@required this.loading,
      this.search,
      this.userId,
      this.orderHistoryItemList});

  factory OrderHistoryState.initial() {
    return OrderHistoryState(
        loading: false,
        search: null,
        userId: null,
        orderHistoryItemList: List());
  }

  OrderHistoryState copyWith(
      {bool loading,
      String search,
      String userId,
      List<OrderHistoryItem> orderHistoryItemList}) {
    return OrderHistoryState(
        loading: loading ?? this.loading,
        search: search ?? this.search,
        userId: userId ?? this.userId,
        orderHistoryItemList:
            orderHistoryItemList ?? this.orderHistoryItemList);
  }
}
