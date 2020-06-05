import 'package:grocery/model/category/category_response.dart';
import 'package:grocery/model/orderhistory/order_history_response.dart';
import 'package:grocery/model/orderhistorydetail/order_history_detail_response.dart';
import 'package:grocery/service/abstract/api_service.dart';
import 'package:grocery/service/network_service_response.dart';

import '../network_type.dart';
import '../restclient.dart';

class NetworkService extends NetworkType implements APIService {
  //static final _baseUrl = '';
  //final _loginUrl = _baseUrl + '';

  var headers = {
    "Content-Type": 'application/json',
    "AUTH_KEY": '',
  };

  NetworkService(RestClient rest) : super(rest);

  @override
  Future login(String email, String password) async {
  return null;
  }

  @override
  Future<NetworkServiceResponse<CategoryResponse>> category(String userId) {
    return null;
  }

  @override
  Future<NetworkServiceResponse<OrderHistoryResponse>> orderHistory(String userId) {
    return null;
  }

  @override
  Future<NetworkServiceResponse<OrderHistoryDetailResponse>> orderHistoryDetail(String userId, String orderId) {
    return null;
  }
}
