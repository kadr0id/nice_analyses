import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_analyses/app/nice_ui/nice_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/bloc/app_bloc.dart';

class ForceUpgradePage extends StatelessWidget {
  const ForceUpgradePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ForceUpgradePage());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(NiceSpacing.lg),
          child: Center(child: _ForceUpgradeCard()),
        ),
      ),
    );
  }
}

class _ForceUpgradeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      key: const Key('forceUpgrade_card'),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(NiceSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Update Your App", style: textTheme.headlineSmall),
            const SizedBox(height: NiceSpacing.lg),
            const Text(
                "You are using an unsupported app version. Please update your app from the App Store to continue."),
            const SizedBox(height: NiceSpacing.lg),
            const _AppStoreButton(),
          ],
        ),
      ),
    );
  }
}

class _AppStoreButton extends StatelessWidget {
  const _AppStoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final upgradeUrl = context.select(
      (AppBloc bloc) => bloc.state.forceUpgrade.upgradeUrl,
    );
    if (upgradeUrl == null) return const SizedBox.shrink();
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => launchUrl(
          Uri.parse(upgradeUrl),
        ),
        child: const Text("GO TO APP STORE"),
      ),
    );
  }
}
