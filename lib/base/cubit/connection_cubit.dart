import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

part 'connection_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late final StreamSubscription connectivityStreamSubscription;

  final Connectivity connectivity;

  bool isThereCurrentDialogShowing = false;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivity.checkConnectivity().then(_connectionChanged);

    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen(_connectionChanged);
  }

  void _connectionChanged(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      emitInternetConnected();
    } else if (connectivityResult == ConnectivityResult.none) {
      emitInternetDisconnected();
    }
  }

  void emitInternetConnected() => emit(InternetConnected());

  void emitInternetDisconnected() => emit(InternetDisconnected());

  Future<void> showConnctionDialog(BuildContext context) async {
    if (isThereCurrentDialogShowing) {
      return;
    }

    isThereCurrentDialogShowing = true;

    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Center(
          child: SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: LottieBuilder.asset(
                'assets/lottie/connection.json',
                height: 100,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  Future<void> closeConnectionDialog(BuildContext context) async {
    if (isThereCurrentDialogShowing) {
      isThereCurrentDialogShowing = false;

      return Navigator.pop(context);
    }
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();

    return super.close();
  }
}
