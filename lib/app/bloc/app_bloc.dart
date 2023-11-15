import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_client/auth_client.dart';
import '../models/force_upgrage.dart';
import '../navigation/deep_link.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    // required AppConfigRepository appConfigRepository,
    // required AuthenticationRepository authenticationRepository,
    required bool isAuthenticated,
  })  : //_authenticationRepository = authenticationRepository,
        super(
        isAuthenticated
            ? const AppState.authenticated()
            : const AppState.unauthenticated(),
      ) {
    // _forceUpgradeSubscription = appConfigRepository
    //     .isForceUpgradeRequired()
    //     .listen(_onForceUpgradeStatusChanged);
    // _isDownForMaintenanceSubscription = appConfigRepository
    //     .isDownForMaintenance()
    //     .listen(_onDownForMaintenanceStatusChanged);
    // _authenticationRepository.authStatus.listen((newStatus) {
    //   add(AppAuthStatusChanged(newStatus));
    // });
    // on<AppAuthStatusChanged>(_statusChanged);
    // on<AppDownForMaintenanceStatusChanged>(_downForMaintenanceStatusChanged);
    // on<AppForceUpgradeStatusChanged>(_forceUpgradeStatusChanged);
    // on<AppLogoutRequested>(_logoutRequested);
    // on<AppDeepLinkRequested>(_onDeepLink);
    // on<AppDeepLinkCleared>(_onDeepLinkCleared);
  }
  }