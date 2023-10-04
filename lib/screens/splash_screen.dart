import 'package:bmi/models/app_colors.dart';
import 'package:bmi/screens/bmi_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BmiScreen()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: AppColors.kBmiPrimary,
      body: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Expanded(child: Center(
              child: Image(image: AssetImage('assets/splashBmi.png'),height: 150,width: 150),
            )),
            Text('Developed by Salma Hamdy ',style:
            TextStyle(color: AppColors.kBmiSelected,
                fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
