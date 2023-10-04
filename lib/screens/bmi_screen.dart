import 'package:bmi/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:bmi/components/bmi_components/gender_container.dart';
import 'package:bmi/components/bmi_components/weight_age_container.dart';
import 'package:bmi/enums/gender_enum.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/models/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  BMIModel bmiModel = BMIModel.setBMI(heightValue: 100,age: 20,weight: 20,);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit,BmiState>(listener: (context , state){},
        builder: (context , state) {
      var cubit = BmiCubit.get(context);
      return Scaffold(
        backgroundColor: AppColors.kBmiPrimary,
        appBar: AppBar(
          backgroundColor: AppColors.kBmiContainers,
          title: const Center(
            child: Text(
              'BMI calculator',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              GenderContainer(
                image: 'assets/mars.png',
                function: (){
                  cubit.changeGender(GenderEnum.male);
                  },
                text: 'Male',
                color: cubit.selectedGender == GenderEnum.male
                    ? AppColors.kBmiSelected
                    : AppColors.kBmiContainers,
                padding: cubit.selectedGender == GenderEnum.male
                    ? const EdgeInsets.all(10)
                    : const EdgeInsets.all(30),
              ),
              GenderContainer(
                image: 'assets/venus.png',
                function: (){
                  cubit.changeGender(GenderEnum.female);
                  },
                text: 'Female',
                color: cubit.selectedGender == GenderEnum.female
                    ? AppColors.kBmiSelected
                    : AppColors.kBmiContainers,
                padding: cubit.selectedGender == GenderEnum.female
                    ? const EdgeInsets.all(10)
                    : const EdgeInsets.all(30),
              ),
            ]),
            const SizedBox(height: 5,),
            Container(
              width: double.infinity,
              height: 160,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.kBmiContainers,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      '${cubit.bmiModel.heightValue!.toInt()}',
                      style: const TextStyle(
                        color: Color(0xffF10606),
                        fontSize: 25,
                      ),
                    ),
                    const Text(
                      'CM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ]),
                  Slider(
                    value: cubit.bmiModel.heightValue!,
                    min: 100,
                    max: 210,
                    thumbColor: const Color(0xffF10606),
                    activeColor: const Color(0xff6200EE),
                    inactiveColor: const Color(0xff979797),
                    label:cubit.bmiModel.heightValue!.round().toString(),
                    onChanged: cubit.calculateHeight,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeightAgeContainer(
                  text: 'WEIGHT',
                  weightOrAge:cubit.bmiModel.weight!,
                  decrement: () {
                    cubit.decrementWeight();

                  },
                  increment: () {
                    cubit.incrementWeight();
                  },
                ),
                WeightAgeContainer(
                  text: 'AGE',
                  weightOrAge: cubit.bmiModel.age!,
                  decrement: () {
                    cubit.decrementAge();
                  },
                  increment: () {
                    cubit.incrementAge();
                  },
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 75,
              width: double.infinity,
              color: AppColors.kBmiButton,
              child: Center(
                child: MaterialButton(onPressed: ()
                {cubit.calculateBmi();
                Navigator.pushAndRemoveUntil(
                    context,MaterialPageRoute(builder: (context) => ( ResultScreen(bmiResult:cubit.bmiModel.result,state:cubit.bmiModel.state,)),),
                        (route) => false);
                },
                    child: const Text('CALCULATE',style: TextStyle(
                        color: Colors.white ,fontSize: 25,fontWeight: FontWeight.bold
                    ),)
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
