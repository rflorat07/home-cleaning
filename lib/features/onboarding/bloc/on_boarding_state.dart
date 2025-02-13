part of 'on_boarding_bloc.dart';

enum OnBoardingStatus { initial, loading, loaded, error }

class OnBoardingState extends Equatable {
  const OnBoardingState({required this.status, required this.currentPageIndex});

  final int currentPageIndex;
  final OnBoardingStatus status;

  @override
  List<Object> get props => [currentPageIndex, status];

  OnBoardingState copyWith({OnBoardingStatus? status, int? currentPageIndex}) {
    return OnBoardingState(
      status: status ?? this.status,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}
