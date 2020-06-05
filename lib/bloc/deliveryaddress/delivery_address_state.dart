import 'package:meta/meta.dart';

class DeliveryAddressState {
  final String name;
  final String email;
  final String mobile;
  final String address;
  bool loading;

  DeliveryAddressState(
      {bool loading,
      @required this.name,
      @required this.email,
      @required this.mobile,
      @required this.address});

  factory DeliveryAddressState.initial() {
    return DeliveryAddressState(
        loading: false, name: null, email: null, mobile: null, address: null);
  }

  DeliveryAddressState copyWith(
      {bool loading,
      String name,
      String email,
      String mobile,
      String address}) {
    return DeliveryAddressState(
        loading: loading ?? this.loading,
        name: name ?? this.name,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        address: address ?? this.address);
  }
}
