import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/screens/bmi_screen.dart';
import 'package:bmi/models/app_colors.dart';
import 'package:flutter/material.dart';
class ResultScreen extends StatelessWidget {
   ResultScreen({required this.bmiResult,this.state,super.key});
  double ? bmiResult ;
  String ? state ;
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: AppColors.kBmiPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Your Result :',style: TextStyle(fontSize: 35,color: Colors.white),),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,MaterialPageRoute(builder: (context) => (const BmiScreen()),),
                    (route) => false);
          }, icon: const Icon(Icons.arrow_back_ios_new,size: 45,color: Colors.white,)),
          const SizedBox(height: 20,),
          Container(
            width: double.infinity,
            height: 450,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
               color: AppColors.kBmiContainers
            ),
            child:Column(
              children: [
                const SizedBox(height: 40,),
                Text(state!,style:  const TextStyle(color: AppColors.kBmiState,fontSize: 35,)),
                const SizedBox(height: 100,)
,                Text(bmiResult!.toInt().toString() ,style: const TextStyle(color: Colors.white,fontSize: 40),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
