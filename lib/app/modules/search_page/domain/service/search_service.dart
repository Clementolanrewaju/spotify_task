import 'dart:convert';

import 'package:spotify_task/app/modules/search_page/data/get_search_model.dart';
import 'package:spotify_task/app/modules/search_page/data/search_model_response.dart';
import 'package:spotify_task/app/shared/helpers/classes/HTTP/HTTP.dart';
import 'package:spotify_task/app/shared/helpers/constants/string_constants.dart';
import 'package:spotify_task/app/shared/helpers/extensions/http_response_extension.dart';
import 'package:spotify_task/core/framework/service_response.dart';

class SearchService {
  static FutureResponse<SearchModelResponse> getAlbum(GetSearchModel model) {
    return serveFuture<SearchModelResponse>(
      function: (fail) async {
        final r = await HTTP.get(
          "https://api.spotify.com/v1/search?query=${model.searchField}&type=album,artist",
        );
        if (r.is200) {
          final data = json.decode(r.body);
          final u = SearchModelResponse.fromJson(data);
          return u;
        }

        if (r.is401) {
          fail(authenticationError);
        }

        fail("Something went wrong");
      },
    );
  }
}
