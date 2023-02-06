import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/modules/search_page/domain/provider/search_provider.dart';
import 'package:spotify_task/app/shared/helpers/functions/dims.dart';
import 'package:spotify_task/app/shared/views/widgets/theme_builder.dart';
import 'package:spotify_task/core/framework/base_notifier.dart';

class AlbumPage extends HookConsumerWidget {
  final String search;
  const AlbumPage({Key? key, required this.search}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.useProvider(getSearchProvider);
    return ThemeBuilder(
      builder: (context, appColor, ref) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (search.isNotEmpty)
              album.when(
                done: (done) {
                  return Expanded(
                    child: GridView.count(
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: List.generate(
                        done.albums!.items!.length,
                        (index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        done.albums!.items![index].images!.first
                                            .url.toString(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                done.albums!.items![index].name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                              Text(
                                done.albums!.items![index].artists!.first.name.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: appColor.tertiaryColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    done.albums!.items![index].albumType!.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: appColor.tertiaryColor),
                                  ),
                                  XBox(context.deviceWidth() / 60),
                                  Icon(
                                    Icons.circle_rounded,
                                    color: appColor.tertiaryColor,
                                    size: 5,
                                  ),
                                  XBox(context.deviceWidth() / 60),
                                  Text(
                                    done.albums!.items![index].releaseDate
                                        .toString().split("-").first,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: appColor.tertiaryColor),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
                error: (e) {
                  return Center(
                      child: Text(
                    e.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: appColor.textColor),
                  ));
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
                  "Search for your favourite album.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: appColor.textColor),
                ),
              )
          ],
        );
      },
    );
  }
}
