import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/modules/search_page/domain/provider/search_provider.dart';
import 'package:spotify_task/app/shared/helpers/functions/dims.dart';
import 'package:spotify_task/app/shared/views/widgets/theme_builder.dart';
import 'package:spotify_task/core/framework/base_notifier.dart';

class ArtistPage extends HookConsumerWidget {
  final String search;
  const ArtistPage({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artist = ref.useProvider(getSearchProvider);
    return ThemeBuilder(builder: (context, appColor, ref) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (search.isNotEmpty)
            artist.when(
              done: (done) {
                return Expanded(
                  child: ListView(
                    children: List.generate(
                      done.artists!.items!.length,
                          (index) {
                        final hasImage =
                            done.artists!.items![index].images!.isNotEmpty;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: hasImage
                                    ? NetworkImage(
                                  done.artists!.items![index].images!
                                      .first.url
                                      .toString(),
                                )
                                    : null,
                                radius: 35,
                                backgroundColor: Colors.transparent,
                                child: !hasImage
                                    ? const Icon(Icons.person_rounded)
                                    : null,
                              ),
                              XBox(context.deviceWidth() / 30),
                              Text(
                                done.artists!.items![index].name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              error: (e) {
                return Text(
                  e.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: appColor.textColor),
                );
              },
              loading: () {
                return Center(
                  child: CupertinoActivityIndicator(
                    color: appColor.successColor,
                  ),
                );
              },
            )
          else
            Center(
              child: Text(
                "Let's help you find your favourite artist.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: appColor.textColor),
              ),
            ),
        ],
      );
    });
  }
}
