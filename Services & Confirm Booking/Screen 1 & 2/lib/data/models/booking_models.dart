class BookingDateModel {
  const BookingDateModel({
    required this.dayAbbr,
    required this.date,
    required this.monthAbbr,
  });

  final String dayAbbr;   // e.g. 'Sun'
  final int date;         // e.g. 28
  final String monthAbbr; // e.g. 'SEP'
}

class BookingServiceModel {
  const BookingServiceModel({
    required this.name,
    required this.price,
    required this.durationMinutes,
  });

  final String name;
  final String price;
  final int durationMinutes;
}

class BookingLocationModel {
  const BookingLocationModel({
    required this.city,
    required this.address,
    required this.zipCode,
  });

  final String city;
  final String address;
  final String zipCode;
}

class BookingSummaryModel {
  const BookingSummaryModel({
    required this.service,
    required this.totalPrice,
    required this.location,
    required this.availableDates,
    required this.timeSlots,
  });

  final BookingServiceModel service;
  final String totalPrice;
  final BookingLocationModel location;
  final List<BookingDateModel> availableDates;
  final List<String> timeSlots;
}

class MockBookingData {
  static const BookingSummaryModel summary = BookingSummaryModel(
    service: BookingServiceModel(
      name: 'Relaxing Prenatal Massage for Expecting Moms',
      price: 'AED 40',
      durationMinutes: 60,
    ),
    totalPrice: 'AED 1660',
    location: BookingLocationModel(
      city: 'Atlanta, GA 30301',
      address: '123 Main Street,Cityville, State 56789,Countryland',
      zipCode: 'Zip code : 543632',
    ),
    availableDates: [
      BookingDateModel(dayAbbr: 'Sun', date: 28, monthAbbr: 'SEP'),
      BookingDateModel(dayAbbr: 'Mon', date: 28, monthAbbr: 'SEP'),
      BookingDateModel(dayAbbr: 'Tue', date: 28, monthAbbr: 'SEP'),
      BookingDateModel(dayAbbr: 'Wed', date: 28, monthAbbr: 'SEP'),
      BookingDateModel(dayAbbr: 'Thu', date: 28, monthAbbr: 'SEP'),
      BookingDateModel(dayAbbr: 'Fri', date: 28, monthAbbr: 'SEP'),
      BookingDateModel(dayAbbr: 'Sat', date: 28, monthAbbr: 'SEP'),
    ],
    timeSlots: [
      '09:00 AM', '09:30 AM', '10:00 AM',
      '10:30 AM', '11:00 AM', '12:00 PM',
      '12:30 PM', '01:00 PM', '01:30 PM',
      '02:00 PM', '02:30 PM', '3:00 PM',
    ],
  );
}
