import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var addWalletCompletionStateProvider = StateNotifierProvider.autoDispose<
    _AddWalletCompletionStateNotifier, AddWalletCompletionState>(
  (ref) {
    var s_ = AddWalletCompletionState(
        pageController: PageController(), currentPage: 0);
    return _AddWalletCompletionStateNotifier(s_);
  },
);

class _AddWalletCompletionStateNotifier
    extends StateNotifier<AddWalletCompletionState> {
  _AddWalletCompletionStateNotifier(AddWalletCompletionState state)
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

class AddWalletCompletionState {
  final PageController pageController;
  final int currentPage;

  AddWalletCompletionState({
    required this.pageController,
    required this.currentPage,
  });

  AddWalletCompletionState copyWith({int? currentPage_}) {
    return AddWalletCompletionState(
      pageController: pageController,
      currentPage: currentPage_ ?? currentPage,
    );
  }
}
