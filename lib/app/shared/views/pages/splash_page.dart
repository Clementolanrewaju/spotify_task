import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/modules/search_page/views/search_page.dart';
import 'package:spotify_task/app/shared/views/widgets/theme_builder.dart';
import 'package:spotify_task/core/navigation/navigator.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        pushTo(context, const SearchPage());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ref.read(getTokenProvider.notifier).getNewTok();
    return ThemeBuilder(
      builder: (_, appColor, __) {
        return Center(child: Image.asset("assets/images/icon3@2x.png"));
      },
    );
  }
}
