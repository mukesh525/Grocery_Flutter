import 'package:grocery/service/abstract/api_service.dart';
import 'package:grocery/service/di/dependency_injection.dart';
import '../network_service_response.dart';

class ApiProvider {
  NetworkServiceResponse apiResult;
  APIService apiService = new Injector().flavor;

  getLogin(String email, String password) async {
    NetworkServiceResponse result = await apiService.login(email, password);
    this.apiResult = result;
  }

  getCategory(String userId) async {
    NetworkServiceResponse result = await apiService.category(userId);
    this.apiResult = result;
  }

  getOrderHistory(String userId) async {
    NetworkServiceResponse result = await apiService.orderHistory(userId);
    this.apiResult = result;
  }

  getOrderHistoryDetail(String userId, String orderId) async {
    NetworkServiceResponse result = await apiService.orderHistoryDetail(userId, orderId);
    this.apiResult = result;
  }
}
