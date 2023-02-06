import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var kycCompletionStateProvider = StateNotifierProvider.autoDispose<
    _KycCompletionStateNotifier, KycCompletionState>(
      (ref) {
    var s_ =
    KycCompletionState(pageController: PageController(), currentPage: 0);
    return _KycCompletionStateNotifier(s_);
  },
);

class _KycCompletionStateNotifier
    extends StateNotifier<KycCompletionState> {
  _KycCompletionStateNotifier(KycCompletionState state) : super(state);

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

class KycCompletionState {
  final PageController pageController;
  final int currentPage;

  KycCompletionState({
    required this.pageController,
    required this.currentPage,
  });

  KycCompletionState copyWith({int? currentPage_}) {
    return KycCompletionState(
      pageController: pageController,
      currentPage: currentPage_ ?? currentPage,
    );
  }
}
