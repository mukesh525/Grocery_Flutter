class OrderHistoryDetail {
  final String name;
  final String imageUrl;
  final bool isPiece;
  final int noPiece;
  final int quantity;
  final double price;

  OrderHistoryDetail(
      {this.name, this.imageUrl, this.isPiece = false, this.noPiece = 0, this.quantity, this.price});
}
