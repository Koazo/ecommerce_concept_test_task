import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/detail_info_cubit/detail_info_cubit.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:ecommerce_concept/features/feed/presentation/pages/cart_page.dart';
import 'package:ecommerce_concept/features/feed/presentation/pages/detail_page.dart';
import 'package:ecommerce_concept/features/feed/presentation/pages/home_page.dart';
import 'package:ecommerce_concept/locator_service.dart' as di;
import 'locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhonesListCubit>(
            create: (context) => sl<PhonesListCubit>()..loadPhones()),
        BlocProvider<DetailInfoCubit>(
            create: (context) => sl<DetailInfoCubit>()..loadDetailInfo()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          iconTheme: const IconThemeData(color: AppColors.mainOrange),
          fontFamily: 'MarkPro',
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        home: const HomePage(),
        routes: <String, WidgetBuilder>{
          '/detail_page': (context) => const DetailPage(),
          // '/cart': (context) => Cart(),
          '/main': (context) => const Main(),
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}
