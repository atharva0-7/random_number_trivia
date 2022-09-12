import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/injector_config.dart';
import 'features/getRandomNumber/presentation/bloc/random_number_bloc/random_number_bloc.dart';
import 'features/getRandomNumber/presentation/screens/my_home_page_screen.dart';

void main() {
  InjectorConfig.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MaterialColor get mdColor {
    Map<int, Color> color = {
      50: const Color.fromRGBO(52, 141, 60, .1),
      100: const Color.fromRGBO(52, 141, 60, .2),
      200: const Color.fromRGBO(52, 141, 60, .3),
      300: const Color.fromRGBO(52, 141, 60, .4),
      400: const Color.fromRGBO(52, 141, 60, .5),
      500: const Color.fromRGBO(52, 141, 60, .6),
      600: const Color.fromRGBO(52, 141, 60, .7),
      700: const Color.fromRGBO(52, 141, 60, .8),
      800: const Color.fromRGBO(52, 141, 60, .9),
      900: const Color.fromRGBO(52, 141, 60, 1),
    };
    return MaterialColor(const Color.fromRGBO(52, 141, 60, 1).value, color);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InjectorConfig.resolve<RandomNumberBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: mdColor,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
