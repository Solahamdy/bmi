import 'package:bmi/models/app_colors.dart';
import 'package:flutter/material.dart';
class WeightAgeContainer extends StatefulWidget {
  String text ;
  int weightOrAge ;
  var decrement ;
  var increment ;
   WeightAgeContainer({required this.text,required this.weightOrAge,this.decrement,this.increment ,
     super.key});

  @override
  State<WeightAgeContainer> createState() => _WeightAgeContainerState();
}

class _WeightAgeContainerState extends State<WeightAgeContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      height: 159,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.kBmiContainers,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text,style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
          const SizedBox(height: 10,),
          Text(widget.weightOrAge.toString(),style: const TextStyle(color: Colors.white,fontSize: 25),),
          const SizedBox(height: 10,),
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: [
              GestureDetector(
                onTap: widget.decrement,
                  child: const ImageIcon(AssetImage('assets/minus icon.png'),size: 45,color: Colors.white)),
              GestureDetector(
                  onTap: widget.increment,
                  child: const ImageIcon(AssetImage('assets/plus icon.png'),size: 45,color: Colors.white,))
            ],
          )



        ],
      ),
    );
  }
}
