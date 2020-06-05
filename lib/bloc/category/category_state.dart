import 'package:grocery/model/category/category_description.dart';
import 'package:meta/meta.dart';

class CategoryState {
  bool loading;
  final List<CategoryDescription> categoryDescriptionList;
  final List<CategoryDescription> wishList;
  final List<CategoryDescription> addToCartList;
  final int shoppingCounter;
  final double totalAmount;

  CategoryState({@required this.loading, this.categoryDescriptionList, this.wishList, this.addToCartList, this.shoppingCounter, this.totalAmount});

  factory CategoryState.initial() {
    return CategoryState(loading: false, categoryDescriptionList: List(), wishList: List(), addToCartList : List(), shoppingCounter: 0, totalAmount : 0.0);
  }

  CategoryState copyWith(
      {bool loading, List<CategoryDescription> categoryDescriptionList, List<CategoryDescription> wishList, List<CategoryDescription> addToCartList, int shoppingCounter, double totalAmount}) {
    return CategoryState(
        loading: loading ?? this.loading,
        categoryDescriptionList: categoryDescriptionList ?? this.categoryDescriptionList,
        wishList: wishList ?? this.wishList,
        addToCartList: addToCartList ?? this.addToCartList,
        shoppingCounter: shoppingCounter ?? this.shoppingCounter,
        totalAmount: totalAmount ?? this.totalAmount);
  }
}
