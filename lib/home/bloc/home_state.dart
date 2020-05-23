part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HideTextInScreen1 extends HomeState {

  final bool hideText;

  const HideTextInScreen1({@required this.hideText});

  @override
  List<Object> get props => [hideText];

  @override
  String toString() => 'HideTextInScreen1 { hideText: $hideText }';
}
