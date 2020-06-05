abstract class HomeEvent {
}

class Slider extends HomeEvent {
  Function callback;
  Slider({this.callback});
}
