import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/modules/search_page/data/get_search_model.dart';
import 'package:spotify_task/app/modules/search_page/data/search_model_response.dart';
import 'package:spotify_task/app/modules/search_page/domain/repository/search_repository.dart';
import 'package:spotify_task/core/framework/base_notifier.dart';

final getSearchProvider = StateNotifierProvider<SearchNotifier,
    searchProvider<SearchModelResponse>>((ref) {
  final repo = ref.read(searchRepository);
  return SearchNotifier(repo);
});

class SearchNotifier extends BaseNotifier<SearchModelResponse> {
  final SearchRepository _repo;

  SearchNotifier(this._repo);

  Future<void> getAlbum(String searchField) async {
    setLoading();
    final model = GetSearchModel(searchField: searchField);
    state = await _repo.getAlbum(model);
  }
}
