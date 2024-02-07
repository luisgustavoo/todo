import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:todo_flutter/cubit/app_cubit.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late SessionManager sessionManager;

  @override
  void initState() {
    super.initState();

    sessionManager = context.get<AppCubit>().sessionManager;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: CircularUserImage(
              userInfo: sessionManager.signedInUser,
              size: 42,
            ),
            title: Text(sessionManager.signedInUser!.userName),
            subtitle: Text(sessionManager.signedInUser!.email ?? ''),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () async {
                final nav = Navigator.of(context);

                final disconnect = await context.get<AppCubit>().disconnect();

                if (disconnect) {
                  await nav.pushNamedAndRemoveUntil('/auth', (route) => false);
                }
              },
              child: const Text('Sign out'),
            ),
          ),
        ],
      ),
    );
  }
}
