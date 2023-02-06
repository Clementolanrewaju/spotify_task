import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var homeCompletionStateProvider = StateNotifierProvider.autoDispose<
    _HomeCompletionStateNotifier, HomeCompletionState>(
      (ref) {
    var s_ =
    HomeCompletionState(pageController: PageController(), currentPage: 0);
    return _HomeCompletionStateNotifier(s_);
  },
);

class _HomeCompletionStateNotifier
    extends StateNotifier<HomeCompletionState> {
  _HomeCompletionStateNotifier(HomeCompletionState state) : super(state);

  void nextPage() {
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
    state = state.copyWith(
      currentPage_: state.currentPage + 1,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
    state = state.copyWith(
      currentPage_: state.currentPage - 1,
    );
  }
}

class HomeCompletionState {
  final PageController pageController;
  final int currentPage;

  HomeCompletionState({
    required this.pageController,
    required this.currentPage,
  });

  HomeCompletionState copyWith({int? currentPage_}) {
    return HomeCompletionState(
      pageController: pageController,
      currentPage: currentPage_ ?? currentPage,
    );
  }
}
