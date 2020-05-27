part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool hideText;
  const HomeState({this.hideText = false});

  @override
  List<Object> get props => [hideText];
}
