import 'package:checkgon/view.models/call.state.view.model.dart';
import 'package:checkgon/view.models/home.view.model.dart';
import 'package:checkgon/views/home.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//refferent: https://medium.com/@pranavpatil6251/call-detection-in-flutter-6efb518efee9
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => CallStateViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
