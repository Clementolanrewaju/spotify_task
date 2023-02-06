import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/providers/ui_providers/app_theme/app_theme_provider.dart';
import 'package:spotify_task/app/shared/config/bar_color.dart';
import 'package:spotify_task/app/shared/utils/theme/app_colors.dart';
import 'package:spotify_task/app/shared/utils/theme/app_theme.dart';

class ThemeBuilder extends ConsumerWidget {
  final Widget Function(
    BuildContext context,
    AppColor appColor,
    WidgetRef ref,
  ) builder;
  final FloatingActionButton? floatingActionButton;
  final bool useScaffold;
  final Color? whiteColor;
  const ThemeBuilder({
    this.whiteColor,
    this.floatingActionButton,
    required this.builder,
    this.useScaffold = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppTheme appTheme = ref.watch<AppTheme>(appThemeProvider);
    AppColor appColor = appTheme.appColor;
    Widget child = GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: builder(context, appColor, ref),
    );
    setStatusBarColor(color: BarColor.white);

    return useScaffold
        ? GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Scaffold(
              floatingActionButton: floatingActionButton,
              backgroundColor: whiteColor ?? appColor.backgroundColor,
              body: child,
            ),
          )
        : child;
  }
}
