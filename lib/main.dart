import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v1/core/application_theme.dart';
import 'package:todo_app_v1/pages/home/home_screen.dart';
import 'package:todo_app_v1/pages/home/home_view/widget/edit_task.dart';
import 'package:todo_app_v1/pages/login/login_view.dart';
import 'package:todo_app_v1/pages/register/register_view.dart';
import 'package:todo_app_v1/pages/splash/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ApplicationTheme.lightTheme,
     darkTheme: ApplicationTheme.darkTheme,
     themeMode: appProvider.currentTheme,
     localizationsDelegates: AppLocalizations.localizationsDelegates,
     supportedLocales: AppLocalizations.supportedLocales,
     locale: Locale(appProvider.currentLocale),
      
      initialRoute: SplashScreen.routeName,
     routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) =>  const HomeScreen(),
        EditTask.routeName: (context) =>  const EditTask(),
       LoginView.routeName: (context) =>  LoginView(),
       RegisterView.routeName: (context) => const RegisterView(),
     },
   );
  }

}