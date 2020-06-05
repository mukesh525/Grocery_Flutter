import 'package:bloc/bloc.dart';
import 'package:grocery/model/orderhistory/order_history_item.dart';
import 'package:grocery/service/viewmodel/api_provider.dart';
import 'package:grocery/utils/vars.dart';
import 'order_history_event.dart';
import 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final ApiProvider apiProvider = ApiProvider();
  String orderId;
  var searchResponse;

  void userIdParam(userIdParam) {
    add(UserIdParam(userIdParam: userIdParam));
    add(OrderHistory());
  }

  void searchInput(search) {
    print(search);
    add(SearchInput(search: search));
  }

  void orderCancel(String orderId) {
    this.orderId = orderId;
    add(OrderCancel());
  }

  @override
  OrderHistoryState get initialState => OrderHistoryState.initial();

  @override
  Stream<OrderHistoryState> mapEventToState(OrderHistoryEvent event) async* {
    if (event is UserIdParam) {
      yield state.copyWith(userId: state.userId);
    }

    if (event is SearchInput) {
      yield state.copyWith(search: event.search);

      if (event.search.isEmpty) {
        yield state.copyWith(
            loading: false, orderHistoryItemList: searchResponse);
      } else {
        List<OrderHistoryItem> _searchList = [];
        searchResponse.forEach((p) {
          if (p.orderId.contains(state.search)) {
            _searchList.add(p);
          }
        });

        yield state.copyWith(loading: false, orderHistoryItemList: _searchList);
      }
    }

    if (event is OrderCancel) {
      state.orderHistoryItemList.removeWhere((item) => item.orderId == orderId);
      yield state.copyWith(
          loading: false, orderHistoryItemList: state.orderHistoryItemList);
    }

    if (event is OrderHistory) {
      yield state.copyWith(loading: true, orderHistoryItemList: List());
      await apiProvider.getOrderHistory(state.userId);

      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          var response = apiProvider.apiResult.response;
          searchResponse = response.orderHistoryItemList;
          yield state.copyWith(
              loading: false,
              orderHistoryItemList: response.orderHistoryItemList);
        } else {
          yield state.copyWith(loading: false);
        }
      } catch (e) {
        yield state.copyWith(loading: false);
      }
    }
  }
}
