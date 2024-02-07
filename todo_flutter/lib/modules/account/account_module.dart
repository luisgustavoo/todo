import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_flutter/modules/account/pages/account_page.dart';

class AccountModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/account';

  @override
  Map<String, WidgetBuilder> get pages {
    return {
      '/': (context) => const AccountPage(),
    };
  }
}
