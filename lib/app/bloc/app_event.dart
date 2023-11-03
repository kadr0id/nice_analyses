part of 'app_bloc.dart';



abstract class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object> get props => [];
}

class AppDownForMaintenanceStatusChanged extends AppEvent {
  @visibleForTesting
  const AppDownForMaintenanceStatusChanged({this.isDownForMaintenance = false});

  final bool isDownForMaintenance;

  @override
  List<Object> get props => [isDownForMaintenance];
}

class AppForceUpgradeStatusChanged extends AppEvent {
  @visibleForTesting
  const AppForceUpgradeStatusChanged(this.forceUpgrade);

  final ForceUpgrade forceUpgrade;

  @override
  List<Object> get props => [forceUpgrade];
}

class AppAuthStatusChanged extends AppEvent {
  const AppAuthStatusChanged(this.authStatus);
  final AuthStatus authStatus;
  @override
  List<Object> get props => [authStatus];
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

class AppDeepLinkRequested extends AppEvent {
  const AppDeepLinkRequested(this.deepLink);
  final DeepLink deepLink;
  @override
  List<Object> get props => [deepLink];
}

class AppDeepLinkCleared extends AppEvent {
  const AppDeepLinkCleared();
  @override
  List<Object> get props => [];
}

