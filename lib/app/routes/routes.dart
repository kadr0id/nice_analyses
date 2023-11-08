
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:nice_analyses/main_analyses/main_analyses.dart';
import 'package:nice_analyses/second_menu/second_menu.dart';

import '../../down_for_maintenance/view/down_for_maintenance_page.dart';
import '../../force_upgrade/view/force_upgrade_page.dart';
import '../bloc/app_bloc.dart';
import '../navigation/deep_link.dart';

List<Page> onGenerateAppViewPages(AppState state, List<Page> pages) {
  switch (state.status) {
    case AppStatus.downForMaintenance:
      return [DownForMaintenancePage.page()];
    case AppStatus.forceUpgradeRequired:
      return [ForceUpgradePage.page()];
    case AppStatus.normal:
      return pages.isNotEmpty ? pages : [MainAnalysesPage.page()];
  }
}

AppState onLocationChanged(Uri location, AppState state, AppBloc bloc) {
  if (location.pathSegments.length > 1) {
    try {
      final deepLink = DeepLink.fromUri(location);
      bloc.add(AppDeepLinkRequested(deepLink));
    } catch (e) {
      log('Invalid Deep Link: $e');
      return state;
    }
  }
  // popping the page with deep link
  if (state.deepLink != null && location.path != state.deepLink?.uri?.path) {
    bloc.add(const AppDeepLinkCleared());
  }

  return state;
}

Page resolveDeepLink(DeepLink deepLink) {
  switch (deepLink.targetPage) {
    case TargetPage.main:
      return MainAnalysesPage.page();

    case TargetPage.login:
      return SecondMenuPage.page(deepLink.id!);
  }
}