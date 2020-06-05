import 'dart:async';
import 'package:grocery/model/category/category_response.dart';
import 'package:grocery/model/login/login_response.dart';
import 'package:grocery/model/orderhistory/order_history_response.dart';
import 'package:grocery/model/orderhistorydetail/order_history_detail_response.dart';
import 'package:grocery/service/abstract/api_service.dart';
import 'package:grocery/utils/vars.dart';
import '../network_service_response.dart';
import 'api_view_model.dart';

class MockService implements APIService {
  @override
  login(String mobile, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(NetworkServiceResponse(
        responseCode: ok200,
        errorMessage: 'Login successful',
        response: LoginResponse(
          userId: '0001',
          name: 'Admin',
          email: 'admin@gmail.com',
          mobile: '1234567890',
          address: '',
          profilePicture:  ''
        )));
  }

  @override
  Future<NetworkServiceResponse<CategoryResponse>> category(String userId) async{
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(responseCode: ok200, response: getCategory(), errorMessage: null));
  }

  @override
  Future<NetworkServiceResponse<OrderHistoryResponse>> orderHistory(String userId) async{
    await Future.delayed(Duration(seconds: 1));
    return Future.value(NetworkServiceResponse(responseCode: ok200, response: getOrderHistory(), errorMessage: null));
  }

  @override
  Future<NetworkServiceResponse<OrderHistoryDetailResponse>> orderHistoryDetail(String userId, String orderId) async{
    await Future.delayed(Duration(seconds: 1));
    return Future.value(NetworkServiceResponse(responseCode: ok200, response: getOrderHistoryDetail(), errorMessage: null));
  }
}
