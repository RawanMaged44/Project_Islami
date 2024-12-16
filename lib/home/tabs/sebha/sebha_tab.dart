import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';

class SebhaController{
  int count = 1;
  String currentPhrase = "سبحان الله";

  void increment(){
    if (count <33){
      count++;
    }else{
      count=1;
      updatePhrase();
    }
  }
  void updatePhrase() {
    if (currentPhrase == "سبحان الله")
    {
      currentPhrase = "الحمد لله";
    }
    else if (currentPhrase == "الحمد لله") {
      currentPhrase = "الله أكبر";
    }
    else {
      currentPhrase = "سبحان الله";
    }
  }

}

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> with SingleTickerProviderStateMixin {
  final SebhaController controller = SebhaController();
  late AnimationController animationController;
  late Animation<double> rotationAnimation;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =AnimationController(vsync: this,
    duration: Duration(milliseconds: 50));
    rotationAnimation = CurvedAnimation(
        parent:animationController,
        curve: Curves.easeInOut);
  }


  void onSebhaTapped(){
    setState(() {

      controller.increment();
      animationController.forward(from: 0.0);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/Logo.png'),
        const Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),),
        const SizedBox(height: 15,),
        GestureDetector(
          onTap: onSebhaTapped,
        child: Stack(
          alignment: Alignment.center,
          children: [
            RotationTransition(
              turns: rotationAnimation,   ///this animation
              child:
              Image.asset('assets/images/SebhaBody 1.png',
                height: MediaQuery.of(context).size.height*.4,
                width: MediaQuery.of(context).size.height*.6,),



            ),
            Column(
              children: [
                Text(controller.currentPhrase,
                  style: const TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                Text(controller.count.toString(),
                  style: const TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            )
          ],
        ),

        ),

      ],
    );
  }
  @override
  void dispose() {    ///to stop animation after it ends
    // TODO: implement dispose
    super.dispose();
  }
}
