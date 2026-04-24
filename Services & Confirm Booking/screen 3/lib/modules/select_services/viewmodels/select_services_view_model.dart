import 'package:flutter/foundation.dart';
import '../../../core/constants/app_assets.dart';
import '../../../data/models/service_model.dart';

class SelectServicesViewModel extends ChangeNotifier {
  // In a real app this comes from SelectServicesRepository.
  // Seeded here so the screen runs standalone without a backend.
  final List<ServiceModel> services = List.generate(
    9,
    (i) => ServiceModel(
      id: 's${i + 1}',
      title: 'Relaxing Prenatal Massage for Expecting Moms',
      imagePath: AppAssets.woman,
      price: 40,
      currency: 'AED',
      durationMinutes: 60,
      visitType: 'Home visit',
    ),
  );
}
