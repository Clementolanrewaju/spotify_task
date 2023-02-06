import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var walletOptionCompletionStateProvider = StateNotifierProvider.autoDispose<
    _WalletOptionCompletionStateNotifier, WalletOptionCompletionState>(
  (ref) {
    var s_ = WalletOptionCompletionState(
        pageController: PageController(), currentPage: 0);
    return _WalletOptionCompletionStateNotifier(s_);
  },
);

class _WalletOptionCompletionStateNotifier
    extends StateNotifier<WalletOptionCompletionState> {
  _WalletOptionCompletionStateNotifier(WalletOptionCompletionState state)
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

class WalletOptionCompletionState {
  final PageController pageController;
  final int currentPage;

  WalletOptionCompletionState({
    required this.pageController,
    required this.currentPage,
  });

  WalletOptionCompletionState copyWith({int? currentPage_}) {
    return WalletOptionCompletionState(
      pageController: pageController,
      currentPage: currentPage_ ?? currentPage,
    );
  }
}
