import 'package:bloc/bloc.dart';
import 'package:grocery/service/viewmodel/api_provider.dart';
import 'package:grocery/utils/vars.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiProvider apiProvider = ApiProvider();

  void emailInput(email) {
    add(EmailInput(email: email));
  }

  void passwordInput(password) {
    add(PasswordInput(password: password));
  }

  void login(callback) {
    add(Login(callback: callback));
  }

  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailInput) {
      yield state.copyWith(email: event.email);
    }

    if (event is PasswordInput) {
      yield state.copyWith(password: event.password);
    }

    if (event is Login) {
      yield state.copyWith(loading: true);
      await apiProvider.getLogin(state.email, state.password);
      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          var response = apiProvider.apiResult.response;
          yield state.copyWith(
            loading: false
          );
          event.callback(response);
        } else {
          yield state.copyWith(
            loading: false,
          );
          event.callback(apiProvider.apiResult.errorMessage);
        }
      } catch (e) {
        yield state.copyWith(
          loading: false
        );
      }
    }
  }
}
