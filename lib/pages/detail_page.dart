import 'package:flutter/material.dart';
import 'package:travel_app_flutter/util/colors.dart';
import 'package:travel_app_flutter/widgets/app_large_text.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

import '../widgets/app_buttons.dart';
import '../widgets/responsive_button.dart';

class DeatilPage extends StatefulWidget {
  const DeatilPage({Key? key}) : super(key: key);

  @override
  State<DeatilPage> createState() => _DeatilPageState();
}

class _DeatilPageState extends State<DeatilPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 600,
                height: size.height * 0.48,
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
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                width: MediaQuery.of(context).size.width,
                height: size.height * 0.7,
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
                        AppLargeText(
                          text: "Yosemite",
                          textColor: Colors.black54,
                        ),
                        AppLargeText(
                          text: "\$ 250",
                          textColor: AppColors.mainColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        AppText(
                          text: "USA, California",
                          textColor: AppColors.mainColor,
                          textSize: 14,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Wrap(
                            // to wrap out lists like stars to mainatin them properly
                            children: List.generate(5, (index) {
                          return Icon(
                            Icons.star_sharp,
                            color: index < gottenStars
                                ? AppColors.starColor
                                : AppColors.textColor1,
                          );
                        })),
                        const SizedBox(
                          width: 8,
                        ),
                        AppText(
                          text: "(4.0)",
                          textColor: AppColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "People",
                      textColor: Colors.black.withOpacity(0.8),
                      textSize: 22,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppText(
                      text: "Number of people in your Group",
                      textColor: AppColors.mainColor,
                      textSize: 14,
                    ),

                    // the List Button
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          // so that is become a button
                          onTap: () {
                            setState(() {
                              selectedIndex =
                                  index; // to triger a reduild on touch i.e index change
                            });
                          },
                          child: Container(
                            // for the margin
                            margin: const EdgeInsets.only(right: 7),
                            child: AppButton(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors
                                      .black, //check for equality meaing touch
                              backgroundColor: selectedIndex == index
                                  ? Colors.black.withOpacity(0.7)
                                  : AppColors.buttonBackground,
                              size: 60,
                              borderColor: selectedIndex == index
                                  ? Colors.grey.withOpacity(0.8)
                                  : AppColors.buttonBackground,
                              textInput: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //discription
                    AppLargeText(
                      text: "Description",
                      textSize: 20,
                      textColor: Colors.black.withOpacity(0.8),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //the description text
                    SingleChildScrollView(
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 60,
                        child: AppText(
                          text:
                              "This site is the pinical of the discovery world of this century, we explore it in depth in our PodCast as in Fuck you Too lol",
                          textSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButton(
                    color: AppColors.mainColor,
                    backgroundColor: Colors.white,
                    size: 60,
                    borderColor: AppColors.mainColor,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ResponsiveButton(
                      width: double.maxFinite,
                      text: "Book Trip Now",
                      isLonger: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
