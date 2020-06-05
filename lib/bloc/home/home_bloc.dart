import 'package:bloc/bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeState.initial();

  void slider() {
    add(Slider());
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Slider) {
      List<String> sliderList = new List();
      sliderList.add('1');
      sliderList.add('2');
      sliderList.add('3');

      yield state.copyWith(sliderList: sliderList);
    }
  }
}
