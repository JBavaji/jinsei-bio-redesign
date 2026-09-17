import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash_bloc.dart';
import '../splash_screen.dart';

/// App-level Boot Gateway that renders SplashScreen initialization overlay
/// until SplashBloc emits isCompleted: true, preserving target URLs & deep links.
class BootGateway extends StatefulWidget {
  final Widget child;

  const BootGateway({
    super.key,
    required this.child,
  });

  @override
  State<BootGateway> createState() => _BootGatewayState();
}

class _BootGatewayState extends State<BootGateway> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const StartSplashCalibrationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, splashState) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: splashState.isCompleted
              ? widget.child
              : const SplashScreen(key: ValueKey('boot_splash_overlay')),
        );
      },
    );
  }
}
