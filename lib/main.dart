import 'package:bloc_api/university_cubit.dart';
import 'package:bloc_api/university_home_page.dart';
import 'package:bloc_api/university_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UniversityAdapter());
  Hive.registerAdapter(UniverResponseAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UniversityCubit()),
        ],
        child: const UniversityHomePage(),
      ),
    );
  }
}
