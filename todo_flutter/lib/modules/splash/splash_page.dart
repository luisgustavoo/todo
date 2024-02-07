import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_flutter/cubit/app_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final nav = Navigator.of(context);

        await context.get<AppCubit>().sessionManager.initialize();

        final isLogged = Injector.get<AppCubit>().sessionManager.isSignedIn;

        switch (isLogged) {
          case true:
            await nav.pushNamedAndRemoveUntil('/todo', (route) => false);
            break;
          default:
            await nav.pushNamedAndRemoveUntil('/auth', (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 0.5,
        ),
      ),
    );
  }
}
