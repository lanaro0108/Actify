import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'views/login_screen.dart';
import 'viewmodels/task_viewmodel.dart';


class ActifyApp extends StatelessWidget {
  const ActifyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Actify',
        theme: AppTheme.theme,
        home: const LoginScreen(),
      ),
    );
  }
}