import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../focus_listener/focus_listener.dart';
import '../bloc/app_bloc.dart';
import '../nice_ui/theme/nice_theme.dart';
import '../routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super (key: key);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:  const NiceTheme().themeData,
      home: const FocusListener(
        child: UrlFlowBuilder(),
      ),
    );
  }
}




class UrlFlowBuilder extends StatelessWidget {
  const UrlFlowBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppBloc>().state;
    return FlowBuilder<AppState>(
      state: state,
      onGeneratePages: (state, pages) {
        if (state.deepLink == null) return onGenerateAppViewPages(state, pages);
        return [
          ...onGenerateAppViewPages(state, pages),
          resolveDeepLink(state.deepLink!),
        ];
      },
    );
  }
}