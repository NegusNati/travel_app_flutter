// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/util/colors.dart';

import 'package:travel_app_flutter/widgets/app_large_text.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //we use TickerProviderStateMixin because TabBar Controller uses vsync (tabbar view have thier own state)

  var exploreImages = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png":"Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
        length: 3,
        vsync: this); //we use vsync 'this' bceaue it need the buildcontext
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // menu and profile picure
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.7)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //dicover text
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Dicover"),
          ),
          const SizedBox(
            height: 20,
          ),
          //tabbar
          Container(
            child: Align(
              alignment:
                  Alignment.centerLeft, // to make it start from the beging
              child: TabBar(
                  labelPadding: const EdgeInsets.only(
                      left: 20, right: 20), // to make it start from the beging
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  controller: tabController, // to have a controller working
                  isScrollable: true, // to make it start from the beging
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: const [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspirations",
                    ),
                    Tab(
                      text: "Imotions",
                    ),
                  ]),
            ),
          ),
          //tabbar view
          Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    // to make it scrollable and user firendly
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                              image: AssetImage("images/mountain.jpeg"),
                              fit: BoxFit.cover,
                            )),
                      );
                    },
                  ),
                  const Text("hjji"),
                  const Text("bey")
                ],
              )),
          const SizedBox(
            height: 30,
          ),
          //Explore text
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore More",
                  textSize: 22,
                ),
                AppText(
                  text: "See all",
                  textSize: 15,
                  textColor: AppColors.textColor1,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 120,
            width: double
                .maxFinite, // we always need the width & hight of a partent of a listView.Builder
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(right: 50),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image:  DecorationImage(
                            image: AssetImage("images/${exploreImages.keys.elementAt(index)}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height:10,),
                      Container(
                        child: AppText(
                          text: exploreImages.values.elementAt(index),
                          textColor: AppColors.textColor2,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// a custom circle Tab indicator
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(
        color: color, radius: radius); //returns a BoxPainter object
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height -
            radius); // to calculate the position of the circle
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
