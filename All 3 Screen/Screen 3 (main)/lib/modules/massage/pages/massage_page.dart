import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/massage_viewmodel.dart';
import '../widgets/massage_app_bar.dart';
import '../widgets/massage_search_bar.dart';
import '../widgets/massage_service_card.dart';
import '../widgets/massage_bottom_bar.dart';
import '../../../core/constants/app_colors.dart';

class MassagePage extends StatefulWidget {
  const MassagePage({super.key});

  @override
  State<MassagePage> createState() => _MassagePageState();
}

class _MassagePageState extends State<MassagePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MassageViewModel>().loadServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MassageViewModel>();

    return Scaffold(
      backgroundColor: AppColors.surface, // Replaced transparent with solid surface color
      body: Stack(
        children: [
          // Removed MassageGradientBg
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const MassageAppBar(),
                const MassageSearchBar(),
                Expanded(
                  child: vm.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 100,
                          ),
                          itemCount: vm.services.length,
                          itemBuilder: (_, i) => MassageServiceCard(
                            service: vm.services[i],
                          ),
                        ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 0, left: 0, right: 0,
            child: MassageBottomBar(),
          ),
        ],
      ),
    );
  }
}
