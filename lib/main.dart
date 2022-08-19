import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:ecommerce_concept/features/feed/presentation/pages/home_page.dart';
import 'package:ecommerce_concept/locator_service.dart' as di;
import 'locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhonesListCubit>(
            create: (context) => sl<PhonesListCubit>()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          iconTheme: const IconThemeData(color: Color(0xffff6e4e)),
          fontFamily: 'MarkPro',
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
