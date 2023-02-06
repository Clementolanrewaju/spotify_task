import 'dart:convert';

import 'package:spotify_task/app/shared/data/get_token_model_response.dart';
import 'package:spotify_task/app/shared/helpers/classes/HTTP/HTTP.dart';
import 'package:spotify_task/app/shared/helpers/extensions/http_response_extension.dart';
import 'package:spotify_task/core/framework/service_response.dart';

class TokenService {
  static FutureResponse<void> getToken() {
    return serveFuture<GetTokenModelResponse>(
      function: (fail) async {
        const clientId = "3af8e17840684c5bb3325a5e8b8e808d";
        const clientSecret = "e46b037b7f76416ca7e3ac9676f557f7";
        final r = await HTTP.post(
          "https://accounts.spotify.com/api/token",
          preferredHeaders: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          encoding: Encoding.getByName('utf-8'),
          body: {
            "grant_type": "client_credentials",
            "client_id": clientId,
            "client_secret": clientSecret,
          },
        );
        if (r.is200) {
          final body = jsonDecode(r.body);
          final x = GetTokenModelResponse.fromJson(Map.from(body));
          HTTP.addHeader(
            key: "Authorization",
            value: "Bearer ${x.accessToken}",
          );
          return x;
        }
        fail("Something went wrong");
      },
    );
  }
}
