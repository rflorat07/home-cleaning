import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/services/shared_preferences_service.dart';
import '../../../service_locator.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc({required this.pageController})
      : super(const OnBoardingState(
            currentPageIndex: 0, status: OnBoardingStatus.initial)) {
    on<UpdatePageIndicator>(_onUpdatePageIndicator);
    on<DotNavigationClick>(_onDotNavigationClick);
    on<NextPage>(_onNextPage);
    on<BackPage>(_onBackPage);
  }

  final PageController pageController;

  void _onUpdatePageIndicator(
      UpdatePageIndicator event, Emitter<OnBoardingState> emit) {
    emit(state.copyWith(currentPageIndex: event.index));
  }

  void _onDotNavigationClick(
      DotNavigationClick event, Emitter<OnBoardingState> emit) {
    if (pageController.hasClients) {
      pageController.animateToPage(
        event.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    emit(state.copyWith(currentPageIndex: event.index));
  }

  void _onNextPage(NextPage event, Emitter<OnBoardingState> emit) async {
    if (state.currentPageIndex == 2) {
      await sl<SharedPreferencesService>().setFirstTime(true);
      emit(state.copyWith(status: OnBoardingStatus.loaded));
    } else {
      int page = state.currentPageIndex + 1;

      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      emit(state.copyWith(currentPageIndex: page));
    }
  }

  void _onBackPage(BackPage event, Emitter<OnBoardingState> emit) {
    if (state.currentPageIndex != 0) {
      int page = state.currentPageIndex - 1;
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentPageIndex: page));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
