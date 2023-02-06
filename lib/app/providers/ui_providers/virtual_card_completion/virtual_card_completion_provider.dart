import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var virtualCardCompletionStateProvider = StateNotifierProvider.autoDispose<
    _VirtualCardCompletionStateNotifier, VirtualCardCompletionState>(
  (ref) {
    var s_ = VirtualCardCompletionState(
        pageController: PageController(), currentPage: 0);
    return _VirtualCardCompletionStateNotifier(s_);
  },
);

class _VirtualCardCompletionStateNotifier
    extends StateNotifier<VirtualCardCompletionState> {
  _VirtualCardCompletionStateNotifier(VirtualCardCompletionState state)
      : super(state);

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

class VirtualCardCompletionState {
  final PageController pageController;
  final int currentPage;

  VirtualCardCompletionState({
    required this.pageController,
    required this.currentPage,
  });

  VirtualCardCompletionState copyWith({int? currentPage_}) {
    return VirtualCardCompletionState(
      pageController: pageController,
      currentPage: currentPage_ ?? currentPage,
    );
  }
}
