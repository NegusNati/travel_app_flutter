import 'package:flutter/material.dart';
import 'package:travel_app_flutter/util/colors.dart';
import 'package:travel_app_flutter/widgets/app_large_text.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

import '../widgets/app_buttons.dart';

class DeatilPage extends StatefulWidget {
  const DeatilPage({Key? key}) : super(key: key);

  @override
  State<DeatilPage> createState() => _DeatilPageState();
}

class _DeatilPageState extends State<DeatilPage> {
   int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // because Stack widget require hight & width

        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 600,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/mountain.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Yosemite", textColor: Colors.black54,),
                        AppLargeText(text: "\$ 250", textColor: AppColors.mainColor,)
                      ],
                    ),
                    const SizedBox( height: 8,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor,size: 14,),
                        const SizedBox(width: 
                        8,),
                        AppText(text: "USA, California", textColor: AppColors.mainColor, textSize: 14,),

                      ],

                    ),
                  const SizedBox( height: 8,),
                  Row(
                    children: [Wrap( // to wrap out lists like stars to mainatin them properly 
                    children:List.generate(5, (index) {
                      return Icon(Icons.star_sharp, color:index<gottenStars? AppColors.starColor: AppColors.textColor1,);
                    })
                  ),
                  const SizedBox(width: 8,),
                    AppText(text: "(4.0)",textColor: AppColors.textColor1,),
                  ],
                  ),
                  const SizedBox(height: 20,),
                  AppLargeText(text: "People",textColor: Colors.black.withOpacity(0.8), textSize: 22,),
                   const SizedBox(height: 8,),
                  AppText(text: "Number of people in your Group", textColor: AppColors.mainColor,textSize: 14,),
                  Wrap(
                    children: List.generate(5, (index) 
                    {
                      return Container( // for the margin
                        margin: const EdgeInsets.only(right: 10),
                        
                        child: AppButton(color: Colors.white, backgroundColor: AppColors.buttonBackground, size: 60, borderColor: AppColors.buttonBackground, textInput:(index + 1).toString(),));

                    })
                  ),


                  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
