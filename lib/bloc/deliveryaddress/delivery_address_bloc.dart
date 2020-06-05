import 'package:bloc/bloc.dart';
import 'package:grocery/service/viewmodel/api_provider.dart';
import 'delivery_address_event.dart';
import 'delivery_address_state.dart';

class DeliveryAddressBloc extends Bloc<DeliveryAddressEvent, DeliveryAddressState> {
  final ApiProvider apiProvider = ApiProvider();

  void nameInput(name) {
    add(NameInput(name: name));
  }

  void emailInput(email) {
    add(EmailInput(email: email));
  }

  void mobileInput(mobile) {
    add(MobileInput(mobile: mobile));
  }

  void addressInput(address) {
    add(AddressInput(address: address));
  }

  @override
  DeliveryAddressState get initialState => DeliveryAddressState.initial();

  @override
  Stream<DeliveryAddressState> mapEventToState(DeliveryAddressEvent event) async* {
    if (event is NameInput) {
      yield state.copyWith(name: event.name);
    }

    if (event is EmailInput) {
      yield state.copyWith(name: event.email);
    }

    if (event is MobileInput) {
      yield state.copyWith(mobile: event.mobile);
    }

    if (event is AddressInput) {
      yield state.copyWith(address: event.address);
    }
  }
}
