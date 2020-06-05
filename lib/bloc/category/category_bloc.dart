import 'package:bloc/bloc.dart';
import 'package:grocery/service/viewmodel/api_provider.dart';
import 'package:grocery/utils/vars.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ApiProvider apiProvider = ApiProvider();
  int id, itemQuantityNo;

  @override
  CategoryState get initialState => CategoryState.initial();

  void category() {
    add(Category());
  }

  void addToCart() {
    add(AddToCart());
  }

  void wishList() {
    add(WishList());
  }

  void isAddItem(int id) {
    this.id = id;
    add(IsAddItem());
    add(AddToCart());
    add(TotalAmount());
  }

  void isFavourite(int id) {
    this.id = id;
    add(IsFavourite());
  }

  void itemQuantity(int id, int itemQuantityNo) {
    this.id = id;
    this.itemQuantityNo = itemQuantityNo;
    add(ItemQuantity());
    add(TotalAmount());
  }

  void totalAmount() {
    add(TotalAmount());
  }

  void clearData() {
    add(ClearData());
  }

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is ClearData) {
      yield state.copyWith(
          categoryDescriptionList: List(),
          wishList: List(),
          addToCartList: List(),
          shoppingCounter: 0,
          totalAmount: 0.0);
    }

    if (event is Category) {
      if (state.categoryDescriptionList.isEmpty) {
        yield state.copyWith(loading: true);
        await apiProvider.getCategory('');

        try {
          if (apiProvider.apiResult.responseCode == ok200) {
            var response = apiProvider.apiResult.response;

            yield state.copyWith(
                loading: false,
                categoryDescriptionList: response.categoryDescriptionList);
          } else {
            yield state.copyWith(loading: false);
          }
        } catch (e) {
          yield state.copyWith(loading: false);
        }
      }
    } else {
      yield state.copyWith(
          loading: false,
          categoryDescriptionList: state.categoryDescriptionList);
    }

    if (event is AddToCart) {
      yield state.copyWith(
          loading: false,
          addToCartList: state.categoryDescriptionList
              .where((item) => item.isAddItem == true)
              .toList());
    }

    if (event is ItemQuantity) {
      int checkData = state.addToCartList.indexWhere((item) => item.id == id);
      state.addToCartList[checkData].quantity = itemQuantityNo;

      TotalAmount();
    }

    if (event is TotalAmount) {
      yield state.copyWith(
          totalAmount:
              state.addToCartList.fold(0, (t, e) => t + e.quantity * e.price));
    }

    if (event is WishList) {
      yield state.copyWith(wishList: state.wishList);
    }

    if (event is IsAddItem) {
      int checkData =
          state.categoryDescriptionList.indexWhere((item) => item.id == id);
      if (checkData != -1)
        state.categoryDescriptionList[checkData].isAddItem =
            state.categoryDescriptionList[checkData].isAddItem ? false : true;

      state.categoryDescriptionList[checkData].quantity = 1;
      yield state.copyWith(
          loading: false,
          categoryDescriptionList: state.categoryDescriptionList);
      id = null;
    }

    if (event is IsFavourite) {
      int checkData =
          state.categoryDescriptionList.indexWhere((item) => item.id == id);
      if (checkData != -1) if (state
          .categoryDescriptionList[checkData].isFavourite) {
        state.wishList.removeWhere((item) => item.id == id);
      } else {
        state.wishList.add(state.categoryDescriptionList[checkData]);
      }

      state.categoryDescriptionList[checkData].isFavourite =
          state.categoryDescriptionList[checkData].isFavourite ? false : true;
      yield state.copyWith(
          loading: false,
          categoryDescriptionList: state.categoryDescriptionList,
          wishList: state.wishList);

      id = null;
    }
  }
}
