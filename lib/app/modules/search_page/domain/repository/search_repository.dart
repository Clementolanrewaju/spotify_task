import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/modules/search_page/data/get_search_model.dart';
import 'package:spotify_task/app/modules/search_page/data/search_model_response.dart';
import 'package:spotify_task/app/modules/search_page/domain/service/search_service.dart';
import 'package:spotify_task/app/shared/domain/repository/token_repository.dart';
import 'package:spotify_task/app/shared/helpers/constants/string_constants.dart';
import 'package:spotify_task/core/framework/base_notifier.dart';

final searchRepository = Provider<SearchRepository>((ref) {
  return SearchRepository(ref);
});

class SearchRepository {
  final ProviderRef ref;

  SearchRepository(this.ref);

  FutureNotifierState<SearchModelResponse> getAlbum(
    GetSearchModel model,
  ) async {
    final response = await SearchService.getAlbum(model);
    if (response.status || response.message != authenticationError) {
      return response.toNotifierState();
    }

    final tokenRepo = ref.read(getTokenRepositoryProvider);
    await tokenRepo.getNewToken();

    return getAlbum(model);
  }
}
