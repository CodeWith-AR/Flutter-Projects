import '../models/massage_service_model.dart';

/// Stub ApiClient import — wire via DI in app_providers.dart
abstract class ApiClient {
  Future<Map<String, dynamic>> get(String endpoint);
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body);
}

class MassageRepository {
  final ApiClient _api;

  MassageRepository(this._api);

  Future<List<MassageServiceModel>> getMassageServices({
    String? query,
    String? sortBy,
    List<String> filters = const [],
  }) async {
    final queryParams = {
      if (query != null && query.isNotEmpty) 'q': query,
      if (sortBy != null) 'sort': sortBy,
      if (filters.isNotEmpty) 'filters': filters.join(','),
    };

    final endpoint = '/massage/services'
        '${queryParams.isNotEmpty ? '?' + queryParams.entries.map((e) => '${e.key}=${e.value}').join('&') : ''}';

    final response = await _api.get(endpoint);
    final items = response['data'] as List<dynamic>;
    return items
        .map((e) => MassageServiceModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> toggleFavourite(String serviceId, bool isFavourited) async {
    await _api.post(
      '/massage/services/$serviceId/favourite',
      {'is_favourited': isFavourited},
    );
  }
}
