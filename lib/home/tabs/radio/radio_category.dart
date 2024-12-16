import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';

class RadioCategory extends StatelessWidget {
 final String radioName ;
 final bool isPlaying;
 final imagePath;


  RadioCategory({required this.radioName, required this.isPlaying,
  required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath),
        alignment: Alignment.bottomLeft),
        color: AppColor.primaryDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(radioName,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite),
              IconButton(
                 icon:  Icon(isPlaying ?
                 Icons.pause : Icons.play_arrow,
                 color: AppColor.blackColor,),
                onPressed: () {
                  
                },
              ),
              Icon(Icons.volume_up)
            ],
          )
        ],
      ),
    );
  }
}
