import 'package:flutter/foundation.dart';
import '../../../data/models/category_model.dart';

class CategoriesViewModel extends ChangeNotifier {
  // ── Search state ───────────────────────────────────────────────────────────
  String _query = '';
  String get query => _query;

  void setQuery(String q) {
    _query = q.trim().toLowerCase();
    notifyListeners();
  }

  // ── Filtered list exposed to UI ────────────────────────────────────────────
  List<CategoryModel> get categories => _query.isEmpty
      ? CategoryModel.allCategories
      : CategoryModel.allCategories.where((c) => c.label.toLowerCase().contains(_query)).toList();
}
