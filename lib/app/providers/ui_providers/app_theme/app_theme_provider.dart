import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/shared/utils/theme/app_theme.dart';

var appThemeProvider =
    StateNotifierProvider.autoDispose<_AppThemeStateNotifier, AppTheme>(
  (ref) => _AppThemeStateNotifier(),
);

class _AppThemeStateNotifier extends StateNotifier<AppTheme> {
  _AppThemeStateNotifier() : super(AppTheme.light());

  void setLightMode() {
    state = AppTheme.light();
  }

  void setDarkMode() {
    state = AppTheme.dark();
  }
}
