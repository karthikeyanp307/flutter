part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ApplyFilter extends HomeEvent {

  final bool hideText;

  const ApplyFilter({@required this.hideText});

  @override
  List<Object> get props => [hideText];

  @override
  String toString() => 'ApplyFilter { hideText: $hideText }';
}