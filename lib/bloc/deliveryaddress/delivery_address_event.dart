abstract class DeliveryAddressEvent {}

class NameInput extends DeliveryAddressEvent {
  final String name;
  NameInput({this.name});
}

class EmailInput extends DeliveryAddressEvent {
  final String email;
  EmailInput({this.email});
}

class MobileInput extends DeliveryAddressEvent {
  final String mobile;
  MobileInput({this.mobile});
}

class AddressInput extends DeliveryAddressEvent {
  final String address;
  AddressInput({this.address});
}
