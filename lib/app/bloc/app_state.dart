part of 'app_bloc.dart';

enum AppStatus { downForMaintenance, forceUpgradeRequired, normal }

class AppState extends Equatable {
  const AppState._({
    this.status = AppStatus.normal,
    this.forceUpgrade = const ForceUpgrade(isUpgradeRequired: false),
    this.authStatus = AuthStatus.unauthenticated,
    this.deepLink,
  });

  const AppState.downForMaintenance()
      : this._(
    status: AppStatus.downForMaintenance,
  );

  const AppState.forceUpgradeRequired(ForceUpgrade forceUpgrade)
      : this._(
    status: AppStatus.forceUpgradeRequired,
    forceUpgrade: forceUpgrade,
  );
  const AppState.authenticated() : this._(authStatus: AuthStatus.authenticated);
  const AppState.unauthenticated()
      : this._(authStatus: AuthStatus.unauthenticated);

  final AppStatus status;
  final ForceUpgrade forceUpgrade;
  final AuthStatus authStatus;
  final DeepLink? deepLink;

  AppState copyWith({
    AppStatus? status,
    ForceUpgrade? forceUpgrade,
    AuthStatus? authStatus,
    DeepLink? deepLink,
  }) =>
      AppState._(
        status: status ?? this.status,
        forceUpgrade: forceUpgrade ?? this.forceUpgrade,
        authStatus: authStatus ?? this.authStatus,
        deepLink: deepLink ?? this.deepLink,
      );

  @override
  List<Object?> get props => [status, forceUpgrade, authStatus, deepLink];
}