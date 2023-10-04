import 'package:bmi/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:bmi/screens/bmi_screen.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/splash_screen.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>BmiCubit())
      ],
        child: const MaterialApp(home: SplashScreen()));
  }
}
