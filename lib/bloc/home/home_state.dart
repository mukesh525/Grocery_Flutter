class HomeState {
  final List<String> sliderList;

  HomeState({this.sliderList});

  factory HomeState.initial() {
    return HomeState(sliderList: List());
  }

  HomeState copyWith({List<String> sliderList}) {
    return HomeState(sliderList: sliderList ?? this.sliderList);
  }
}
