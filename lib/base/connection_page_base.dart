import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/base/cubit/connection_cubit.dart';
import 'package:game/base/page_base.dart';

abstract class ConnectionPageBase extends PageWidget
    implements AutoRouteWrapper {
  const ConnectionPageBase({super.key});

  @protected
  Widget readyContent(BuildContext context);

  @override
  @nonVirtual
  Widget widgetBody(BuildContext context, Size size) {
    final blocInternet = BlocProvider.of<InternetCubit>(context, listen: false);

    return BlocListener<InternetCubit, InternetState>(
      bloc: blocInternet,
      listener: ((context, state) {
        if (state is InternetDisconnected) {
          context.read<InternetCubit>().showConnctionDialog(context);
        }
        if (state is InternetConnected) {
          context.read<InternetCubit>().closeConnectionDialog(context);
        }
      }),
      child: readyContent(context),
    );
  }
}
