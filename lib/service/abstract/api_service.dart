import 'package:grocery/model/category/category_response.dart';
import 'package:grocery/model/orderhistory/order_history_response.dart';
import 'package:grocery/model/orderhistorydetail/order_history_detail_response.dart';

import '../network_service_response.dart';

abstract class APIService {
  login(String email, String password);
  Future<NetworkServiceResponse<CategoryResponse>> category(String userId);
  Future<NetworkServiceResponse<OrderHistoryResponse>> orderHistory(String userId);
  Future<NetworkServiceResponse<OrderHistoryDetailResponse>> orderHistoryDetail(String userId, String orderId);
}
