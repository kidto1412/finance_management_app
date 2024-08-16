import 'package:finance_management/providers/bank_provider.dart';
import 'package:finance_management/providers/category_provider.dart';
import 'package:finance_management/providers/user_provider.dart';
import 'package:finance_management/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => BankProvider()),
    ],
    child: GetMaterialApp(
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
