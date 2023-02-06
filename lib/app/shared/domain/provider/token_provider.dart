import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/modules/search_page/views/search_page.dart';
import 'package:spotify_task/app/shared/data/get_token_model_response.dart';
import 'package:spotify_task/app/shared/domain/repository/token_repository.dart';
import 'package:spotify_task/core/framework/base_notifier.dart';
import 'package:spotify_task/core/navigation/navigator.dart';

final getTokenProvider = StateNotifierProvider.autoDispose<GetNewTokenNotifier,
    searchProvider<GetTokenModelResponse>>((ref) {
  final repo = ref.read(getTokenRepositoryProvider);
  return GetNewTokenNotifier(repo);
});

class GetNewTokenNotifier extends BaseNotifier<GetTokenModelResponse> {
  final GetTokenRepository _repo;

  GetNewTokenNotifier(this._repo);

  void getNewTok(context) async {
    setLoading();
    final state = await _repo.getNewToken();
    if (state.isDone) {
      pushTo(context, const SearchPage());
      return;
    }
    context.showError(state.message!);
  }
}
