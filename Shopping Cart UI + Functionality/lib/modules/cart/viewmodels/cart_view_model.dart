import 'package:flutter/foundation.dart';
import '../../../data/models/cart_item_model.dart';

class CartViewModel extends ChangeNotifier {
  // ── State ─────────────────────────────────────────────────────────────────

  final List<CartItemModel> _items = List.from(CartItemModel.mockItems);

  // Fixed order charges
  static const double _discount        = 4;
  static const double _deliveryCharges = 2;

  // ── Getters (computed, always in sync) ────────────────────────────────────

  List<CartItemModel> get items => List.unmodifiable(_items);

  int get itemCount => _items.length;

  double get subtotal => _items.fold(0, (sum, i) => sum + i.lineTotal);

  double get discount => _items.isEmpty ? 0 : _discount;

  double get deliveryCharges => _items.isEmpty ? 0 : _deliveryCharges;

  double get total => subtotal - discount + deliveryCharges;

  // ── Mutations ─────────────────────────────────────────────────────────────

  void increment(String id) {
    final idx = _items.indexWhere((i) => i.id == id);
    if (idx == -1) return;
    _items[idx] = _items[idx].copyWith(quantity: _items[idx].quantity + 1);
    notifyListeners();
  }

  void decrement(String id) {
    final idx = _items.indexWhere((i) => i.id == id);
    if (idx == -1) return;
    if (_items[idx].quantity <= 1) {
      remove(id);
      return;
    }
    _items[idx] = _items[idx].copyWith(quantity: _items[idx].quantity - 1);
    notifyListeners();
  }

  void remove(String id) {
    _items.removeWhere((i) => i.id == id);
    notifyListeners();
  }
}
