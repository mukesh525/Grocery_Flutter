abstract class OrderHistoryEvent {}

class UserIdParam extends OrderHistoryEvent {
  final String userIdParam;
  UserIdParam({this.userIdParam});
}

class OrderHistory extends OrderHistoryEvent {}

class OrderCancel extends OrderHistoryEvent {}

class SearchInput extends OrderHistoryEvent {
  final String search;
  SearchInput({this.search});
}
