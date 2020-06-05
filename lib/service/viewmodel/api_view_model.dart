import 'package:grocery/model/category/category_description.dart';
import 'package:grocery/model/category/category_response.dart';
import 'package:grocery/model/orderhistory/order_history_item.dart';
import 'package:grocery/model/orderhistory/order_history_response.dart';
import 'package:grocery/model/orderhistorydetail/order_history_detail.dart';
import 'package:grocery/model/orderhistorydetail/order_history_detail_response.dart';
import 'package:grocery/utils/vars.dart';

getCategory() {
  List<CategoryDescription> categoryDescriptionList = List();
  categoryDescriptionList.add(CategoryDescription(
    id: 1,
    name: 'Tomato',
    description: '',
    imageUrl: 'vegitable_tomato.jpg',
    price: 40.00,
  ));

  categoryDescriptionList.add(CategoryDescription(
      id: 2,
      name: 'Kiwi',
      description: '',
      imageUrl: 'fruit_kiwi.jpg',
      isPiece: true,
      noPiece: 4,
      price: 100.00));

  categoryDescriptionList.add(CategoryDescription(
      id: 3,
      name: 'Lemons',
      description: '',
      imageUrl: 'vegitable_lemons.jpg',
      price: 30.00));

  categoryDescriptionList.add(CategoryDescription(
      id: 4,
      name: 'Grapes',
      description: '',
      imageUrl: 'fruit_grapes.jpg',
      price: 100.00));

  return CategoryResponse(
      status: ok200,
      message: '',
      categoryDescriptionList: categoryDescriptionList);
}

getOrderHistory() {
  List<OrderHistoryItem> orderHistoryItemList = List();

  orderHistoryItemList.add(OrderHistoryItem(
      orderId: '0001',
      name: 'Admin',
      email: 'admin@gmail.com',
      mobile: '0000000000',
      address: 'Address',
      price: 100.0,
      totalAmount: 0.0,
      quantity: 1,
      status: 'Pending',
      orderDate: '00-00-0000',
      deliveryDate: '00-00-0000',
      orderCancel: true));

  orderHistoryItemList.add(OrderHistoryItem(
      orderId: '0002',
      name: 'Kamlesh',
      email: 'admin@gmail.com',
      mobile: '0000000000',
      address: 'Address',
      price: 100.0,
      totalAmount: 0.0,
      quantity: 1,
      status: 'Complete',
      orderDate: '00-00-0000',
      deliveryDate: '00-00-0000'));

  return OrderHistoryResponse(
      status: ok200, message: '', orderHistoryItemList: orderHistoryItemList);
}

getOrderHistoryDetail() {
  List<OrderHistoryDetail> orderHistoryDetailList = List();

  orderHistoryDetailList.add(OrderHistoryDetail(
      name: 'Kiwi',
      imageUrl: 'fruit_kiwi.jpg',
      isPiece: true,
      noPiece: 4,
      quantity: 1,
      price: 100.00
  ));

  return OrderHistoryDetailResponse(
      status: ok200, message: '', orderHistoryDetailList: orderHistoryDetailList);
}