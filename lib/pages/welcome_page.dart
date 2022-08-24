import 'package:flutter/material.dart';
import 'package:travel_app_flutter/widgets/app_large_text.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List welcomeImages = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ]; // list of images for welcome page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // to create the slider list (to slide) w euse PageView.builder
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: welcomeImages.length,
        itemBuilder: (_, index) { // _ means default context
       return Container(
        
        width: double.maxFinite,
        height: double.maxFinite, // so that it contain the max hight of the screen
        decoration: BoxDecoration( // we use BoxDecoration to show the images
        image: DecorationImage(image: AssetImage("images/${welcomeImages[index]}"),
        fit: BoxFit.cover // so that the image would fit the whole Container
        ),
        
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 150, left: 20, right: 20, bottom: 20  ),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // to make it all start in the begining 
              children: [
                AppLargeText(text: "Trips"),
                AppText(text: "Discover", textSize: 20,),
                AppText(text: "jbnsbdskajbsjadjskdasjnd", textSize: 15,),
                
              ]
            )
          ]),


        ),
       );
        
      }  ), /*Creates a scrollable list that works page by page using widgets that are created on demand.This constructor is appropriate for page views with a large (or infinite) number of children because the builder is called only for those children that are actually visible.
  */
  
    );
  }
}