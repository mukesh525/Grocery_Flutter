class CategoryDescription {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final bool isPiece;
  final int noPiece;
  final double price;
  bool isAddItem, isFavourite;
  int quantity;

  CategoryDescription(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.isPiece = false,
      this.noPiece,
      this.price,
      this.isAddItem: false,
      this.isFavourite: false,
      this.quantity = 1});
}
