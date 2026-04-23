import 'package:flutter/foundation.dart';
import '../../../data/models/massage_service_model.dart';
import '../../../data/repositories/massage_repository.dart';

enum SortOption { recommended, priceLow, priceHigh, ratingHigh }

class MassageViewModel extends ChangeNotifier {
  final MassageRepository _repo;

  MassageViewModel(this._repo);

  // ── State ──────────────────────────────────────────────────────────
  List<MassageServiceModel> services = [];
  bool isLoading = false;
  String? errorMessage;
  String searchQuery = '';
  SortOption selectedSort = SortOption.recommended;
  int activeImageIndex = 0;

  // ── Actions ────────────────────────────────────────────────────────

  Future<void> loadServices() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      services = await _repo.getMassageServices(
        query: searchQuery,
        sortBy: _sortLabel(selectedSort),
      );
    } catch (e) {
      errorMessage = 'Failed to load services. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavourite(MassageServiceModel service) async {
    service.isFavourited = !service.isFavourited;
    notifyListeners();
    try {
      await _repo.toggleFavourite(service.id, service.isFavourited);
    } catch (_) {
      // Revert optimistic update
      service.isFavourited = !service.isFavourited;
      notifyListeners();
    }
  }

  void onSearchChanged(String value) {
    searchQuery = value;
    notifyListeners();
    loadServices();
  }

  void onSortChanged(SortOption sort) {
    selectedSort = sort;
    notifyListeners();
    loadServices();
  }

  void onPageChanged(int index) {
    activeImageIndex = index;
    notifyListeners();
  }

  // ── Private ────────────────────────────────────────────────────────

  String _sortLabel(SortOption option) {
    switch (option) {
      case SortOption.recommended: return 'recommended';
      case SortOption.priceLow:    return 'price_asc';
      case SortOption.priceHigh:   return 'price_desc';
      case SortOption.ratingHigh:  return 'rating_desc';
    }
  }
}
