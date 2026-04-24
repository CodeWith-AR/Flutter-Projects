import 'package:flutter/foundation.dart';
import '../../../data/models/booking_models.dart';

class ConfirmBookingViewModel extends ChangeNotifier {
  ConfirmBookingViewModel() {
    _data = MockBookingData.summary;
  }

  late final BookingSummaryModel _data;

  // Getters for UI
  String get serviceName => _data.service.name;
  String get servicePrice => _data.service.price;
  int get serviceDuration => _data.service.durationMinutes;
  String get totalPrice => _data.totalPrice;
  String get locationCity => _data.location.city;
  String get locationAddress => _data.location.address;
  String get locationZip => _data.location.zipCode;
  List<BookingDateModel> get dates => _data.availableDates;
  List<String> get timeSlots => _data.timeSlots;

  // ── Tab ───────────────────────────────────────────────────────────────────
  int selectedTabIndex = 0; // 0 = Home Visit, 1 = At Provider

  void selectTab(int i) {
    selectedTabIndex = i;
    notifyListeners();
  }

  // ── Date selection ────────────────────────────────────────────────────────
  int selectedDateIndex = 0; // 'Sun 28 SEP' pre-selected

  void selectDate(int i) {
    selectedDateIndex = i;
    notifyListeners();
  }

  // ── Time slot selection ───────────────────────────────────────────────────
  String selectedTimeSlot = '01:00 PM';

  void selectTime(String slot) {
    selectedTimeSlot = slot;
    notifyListeners();
  }
}
