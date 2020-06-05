import 'package:bloc/bloc.dart';
import 'package:grocery/service/viewmodel/api_provider.dart';
import 'change_password_event.dart';
import 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ApiProvider apiProvider = ApiProvider();

  void currentPasswordInput(currentPassword) {
    add(CurrentPasswordInput(currentPassword: currentPassword));
  }

  void newPasswordInput(newPassword) {
    add(NewPasswordInput(newPassword: newPassword));
  }

  void newConfirmPasswordInput(newConfirmPasswordInput) {
    add(NewConfirmPasswordInput(newConfirmPasswordInput: newConfirmPasswordInput));
  }

  void changePassword(callback) {
    add(ChangePassword(callback: callback));
  }

  @override
  ChangePasswordState get initialState => ChangePasswordState.initial();

  @override
  Stream<ChangePasswordState> mapEventToState(ChangePasswordEvent event) async* {
    if (event is CurrentPasswordInput) {
      yield state.copyWith(currentPassword: event.currentPassword);
    }

    if (event is NewPasswordInput) {
      yield state.copyWith(newPassword: event.newPassword);
    }

    if (event is NewConfirmPasswordInput) {
      yield state.copyWith(newConfirmPassword: event.newConfirmPasswordInput);
    }

    if (event is ChangePassword) {

    }
  }
}
