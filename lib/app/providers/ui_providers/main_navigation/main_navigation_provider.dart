import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var mainNavigationStateProvider = StateNotifierProvider.autoDispose<
    _MainNavigationStateNotifier, MainNavigationState>((ref) {
  var s_ =
      MainNavigationState(pageController: PageController(), currentPage: 0);
  return _MainNavigationStateNotifier(s_);
});

class _MainNavigationStateNotifier extends StateNotifier<MainNavigationState> {
  _MainNavigationStateNotifier(MainNavigationState state) : super(state);

  void jumpToPage(int page) {
    state.pageController.jumpToPage(page);
    state = state.copyWith(currentPage_: page);
  }
}

class MainNavigationState {
  final PageController pageController;
  final int currentPage;

  MainNavigationState({
    required this.pageController,
    required this.currentPage,
  });

  MainNavigationState copyWith({int? currentPage_}) {
    return MainNavigationState(
      pageController: pageController,
      currentPage: currentPage_ ?? currentPage,
    );
  }
}
