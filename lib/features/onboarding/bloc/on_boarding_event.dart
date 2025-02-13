part of 'on_boarding_bloc.dart';

sealed class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object> get props => [];
}

class UpdatePageIndicator extends OnBoardingEvent {
  const UpdatePageIndicator(this.index);

  final int index;

  @override
  List<Object> get props => [];
}

class DotNavigationClick extends OnBoardingEvent {
  const DotNavigationClick(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

class NextPage extends OnBoardingEvent {
  const NextPage();

  @override
  List<Object> get props => [];
}

class BackPage extends OnBoardingEvent {
  const BackPage();

  @override
  List<Object> get props => [];
}
