import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/nice_ui.dart';

class DownForMaintenancePage extends StatelessWidget {
  const DownForMaintenancePage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage<void>(child: DownForMaintenancePage());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(NiceSpacing.lg),
          child: Center(child: _DownForMaintenanceCard()),
        ),
      ),
    );
  }
}

class _DownForMaintenanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      key: const Key('downForMaintenance_card'),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(NiceSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "We Are Currently Experiencing Difficulties.",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: NiceSpacing.lg),
            const Text("Our app is currently offline. Please check back later or contact customer support."),
          ],
        ),
      ),
    );
  }
}
