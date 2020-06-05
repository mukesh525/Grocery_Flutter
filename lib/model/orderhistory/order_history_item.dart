class OrderHistoryItem {
  final String orderId;
  final String name;
  final String email;
  final String mobile;
  final String address;
  final double price;
  final double totalAmount;
  final int quantity;
  final String status;
  final String orderDate;
  final String deliveryDate;
  final bool orderCancel;

  OrderHistoryItem(
      {this.orderId,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.price,
      this.totalAmount,
      this.quantity,
      this.status,
      this.orderDate,
      this.deliveryDate,
      this.orderCancel : false});
}
