import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/modules/search_page/domain/provider/search_provider.dart';
import 'package:spotify_task/app/modules/search_page/views/filter_pages/album/album_page.dart';
import 'package:spotify_task/app/modules/search_page/views/filter_pages/artist/artist_page.dart';
import 'package:spotify_task/app/providers/ui_providers/search_filter/search_filter_completion_provider.dart';
import 'package:spotify_task/app/shared/helpers/functions/dims.dart';
import 'package:spotify_task/app/shared/views/widgets/buttons/search_filter_button.dart';
import 'package:spotify_task/app/shared/views/widgets/custom_text_field.dart';
import 'package:spotify_task/app/shared/views/widgets/theme_builder.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = useState("");
    return ThemeBuilder(builder: (context, appColor, ref) {
      SearchFilterCompletionState s = ref.watch(
        searchFilterCompletionStateProvider,
      );
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: appColor.textColor,
                ),
              ),
              CustomTextField(
                onChanged: (v) {
                  search.value = v.toString();
                  if (search.value.trim().isNotEmpty) {
                    final provider = ref.read(getSearchProvider.notifier);
                    provider.getAlbum(search.value);
                  }
                },
                hint: "Artists, albums...",
                headerLess: false,
                appColor: appColor,
                prefix: Row(
                  children: const [
                    XBox(5),
                    Icon(Icons.search_rounded),
                  ],
                ),
              ),
              const YBox(20),
              SearchFilterButton(
                appColor: appColor,
                ref: ref,
              ),
              const YBox(30),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: s.pageController,
                  children: [
                    AlbumPage(
                      search: search.value,
                    ),
                    ArtistPage(
                      search: search.value,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
