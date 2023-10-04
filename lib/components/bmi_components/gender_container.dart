import 'package:bmi/models/app_colors.dart';
import 'package:flutter/material.dart';
class GenderContainer extends StatefulWidget {
  String image ;
  var padding ;
  var  function ;
  String text ;
  var color ;
  GenderContainer({required this.image,required this.function,required this.text,this.color,this.padding
   , super.key});

  @override
  State<GenderContainer> createState() => _GenderContainerState();
}

class _GenderContainerState extends State<GenderContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        width: 136,
        height: 159,
        padding: widget.padding,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color
        ),
        child:Column(
          children: [
            Image(image: AssetImage(widget.image)),
            const SizedBox(height: 20,),
            Text(widget.text ,style: const TextStyle(color: Colors.white,fontSize: 25)),
          ],
        )

      ),
    );
  }
}
