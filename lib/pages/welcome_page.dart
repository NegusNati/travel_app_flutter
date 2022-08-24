import 'package:flutter/material.dart';
import 'package:travel_app_flutter/widgets/app_large_text.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

import '../util/colors.dart';
import '../util/list_of_text.dart';
import '../widgets/responsive_button.dart';

//Carousel Slider for the welcome page
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
          itemBuilder: (_, index) {
            // _ means default context
            return Container(
              width: double.maxFinite,
              height: double
                  .maxFinite, // so that it contain the max hight of the screen
              decoration: BoxDecoration(
                // we use BoxDecoration to show the images
                image: DecorationImage(
                    image: AssetImage("images/${welcomeImages[index]}"),
                    fit: BoxFit
                        .cover // so that the image would fit the whole Container
                    ),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                    top: 150, left: 20, right: 20, bottom: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // to make it all start in the begining
                          children: [
                            AppLargeText(text: wlecomeText[index][0]),
                            AppText(
                              text: wlecomeText[index][1],
                              textSize: 30,
                              textColor: AppColors.textColor2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 250,
                              child: AppText(
                                text: wlecomeText[index][2],
                                textSize: 14,
                                textColor: AppColors.textColor2,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ResponsiveButton(
                              width: 120,
                            ),
                          ]),
                      Column(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: indexDots == index
                                ? 25
                                : 8, // while the two indexes are equal make the hight 25 for that indexDot, while the others are 8
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: indexDots == index
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(
                                      0.4), // while the two indexes are equal make the color blue for that indexDot, while the others are textcolor1
                            ),
                          );
                        }),
                      )
                    ]),
              ),
            );
          }), /*Creates a scrollable list that works page by page using widgets that are created on demand.This constructor is appropriate for page views with a large (or infinite) number of children because the builder is called only for those children that are actually visible.
  */
    );
  }
}
