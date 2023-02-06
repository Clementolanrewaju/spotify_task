import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var searchFilterCompletionStateProvider = StateNotifierProvider.autoDispose<
    _SearchFilterCompletionStateNotifier, SearchFilterCompletionState>(
  (ref) {
    var s_ =
        SearchFilterCompletionState(pageController: PageController(), currentPage: 0);
    return _SearchFilterCompletionStateNotifier(s_);
  },
);

class _SearchFilterCompletionStateNotifier
    extends StateNotifier<SearchFilterCompletionState> {
  _SearchFilterCompletionStateNotifier(SearchFilterCompletionState state) : super(state);

  void nextPage() {
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
    state = state.copyWith(
      currentPage_: state.currentPage + 1,
    );
  }

  void jumpToPage(int page) {
    state.pageController.jumpToPage(page);
    state = state.copyWith(currentPage_: page);
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

class SearchFilterCompletionState {
  final PageController pageController;
  final int currentPage;

  SearchFilterCompletionState({
    required this.pageController,
    required this.currentPage,
  });

  SearchFilterCompletionState copyWith({int? currentPage_}) {
    return SearchFilterCompletionState(
      pageController: pageController,
      currentPage: currentPage_ ?? currentPage,
    );
  }
}
