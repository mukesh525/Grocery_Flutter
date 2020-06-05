import 'package:bloc/bloc.dart';
import 'package:grocery/service/viewmodel/api_provider.dart';
import 'package:grocery/utils/vars.dart';
import 'order_history_detail_event.dart';
import 'order_history_detail_state.dart';

class OrderHistoryDetailBloc extends Bloc<OrderHistoryDetailEvent, OrderHistoryDetailState> {
  var apiProvider = ApiProvider();
  String userId, orderId;

  void orderHistoryDetail(userId, orderId) {
    this.userId = userId;
    this.orderId = orderId;
    add(OrderHistoryDetail());
  }

  @override
  OrderHistoryDetailState get initialState => OrderHistoryDetailState.initial();

  @override
  Stream<OrderHistoryDetailState> mapEventToState(OrderHistoryDetailEvent event) async* {

    if (event is OrderHistoryDetail) {
      yield state.copyWith(loading: true, orderHistoryDetailList: List());
      await apiProvider.getOrderHistoryDetail(userId, orderId);

      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          var response = apiProvider.apiResult.response;
          yield state.copyWith(
              loading: false,
              orderHistoryDetailList: response.orderHistoryDetailList);
        } else {
          yield state.copyWith(loading: false);
        }
      } catch (e) {
        yield state.copyWith(loading: false);
      }
    }
  }
}
