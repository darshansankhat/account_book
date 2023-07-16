import 'package:account_book/expense_tracker/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

import 'expense_tracker/view/account_info.dart';
import 'expense_tracker/view/accounts_screen.dart';
import 'expense_tracker/view/add_accounts.dart';
import 'expense_tracker/view/entery_screen.dart';
import 'expense_tracker/view/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.teal.shade600),
  );

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        initialRoute: "splash",
        routes: {
          "/": (context) => HomeScreen(),
          "splash": (context) => SplashScreen(),
          "addAccounts": (context) => AddAccountsScreen(),
          "accounts": (context) => AccountsScreen(),
          "accountsinfo": (context) => AccountInfoScreen(),
          "entry": (context) => EntryScreen(),
        },
      ),
    ),
  );
}
