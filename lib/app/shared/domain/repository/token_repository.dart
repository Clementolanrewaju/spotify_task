import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/shared/domain/service/get_token_service.dart';
import 'package:spotify_task/core/framework/base_notifier.dart';
import 'package:spotify_task/core/framework/convert_functions.dart';

final getTokenRepositoryProvider = Provider((ref) {
  return GetTokenRepository();
});

class GetTokenRepository {
  FutureNotifierState<void> getNewToken() async {
    return convert(TokenService.getToken);
  }
}
