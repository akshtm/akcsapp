import 'dart:developer';

import 'package:akcsapp/Controllers_Getx/dashcontroller.dart';
import 'package:akcsapp/scReens/akcs/aKcsProductDetails.dart';
import 'package:akcsapp/scReens/farmDetails.dart';
import 'package:akcsapp/widgets/akscsshimmer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class AKcsScreen extends StatelessWidget {
  AKcsScreen({Key? key}) : super(key: key);
  Dashcontroller dashcontrol = Get.put(Dashcontroller());
  var size, height, width;
  var dt = DateTime.now();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
        child: ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: height / 5,
          child: CarouselSlider(
            items: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/hotelservice-7c244.appspot.com/o/promotion%20images%2Fchicken-farming-Feature-imagedsd.jpg?alt=media&token=3eb8dfd2-c1d8-4681-a3a5-90608437d25e'
                              // 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images04.jpg'
                              ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.vox-cdn.com/thumbor/URub_l1Sz39xOpUrv2rIWFnw1io=/0x0:4581x3021/1400x1050/filters:focal(2154x724:2886x1456):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/67557756/GettyImages_120083561.0.0.jpg'),
                      //  'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://sentientmedia.org/wp-content/uploads/2021/04/chicken-chick-farm.jpg'),
                      // 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images03.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              //onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(20, 7, 0, 0),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: ((context, index) {
              var icon;
              var txt;
              var color;

              switch (index) {
                case 0:
                  icon = Icons.call_outlined;
                  txt = 'Call Us';
                  color = Color.fromARGB(255, 189, 187, 187);

                  break;
                case 1:
                  icon = Icons.location_on_outlined;
                  txt = 'Location';
                  color = Color.fromARGB(255, 232, 227, 227);

                  break;
                case 2:
                  icon = Icons.whatsapp;
                  txt = 'Message';
                  color = Color.fromARGB(255, 129, 189, 161);

                  break;
                case 3:
                  icon = Icons.home_filled;
                  txt = 'Our Farm';
                  color = Color.fromARGB(255, 199, 180, 180);

                  break;

                case 4:
                  icon = Icons.info_outline_rounded;
                  txt = ' About Us';
                  color = Color.fromARGB(255, 183, 199, 186);

                  break;
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width / 6.7,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: color,
                    // Color.fromARGB(255, 5, 187, 219),

                    //  Theme.of(context).primaryColor,
                    child: IconButton(
                        onPressed: () {
                          if (index == 0) {
                            dashcontrol.makingphonecall();
                            log('call');
                          } else if (index == 1) {
                            log('locaction');

                            Get.defaultDialog(
                              title: 'location',
                              middleText:
                                  'working on\n 11°15 44.3"N 75°55 23.7 E',
                              textCancel: 'OK',
                              cancelTextColor:
                                  Color.fromARGB(255, 255, 200, 36),
                            );
                          } else if (index == 2) {
                            log('Whatsapp');

                            dashcontrol.launchWhatsApp();
                          } else if (index == 3) {
                            log('Our farm');
                            Get.to(() => FarmDetails());
                          } else if (index == 4) {
                            Get.defaultDialog(
                                title: 'About Us',
                                middleText: '.........',
                                textCancel: 'OK',
                                cancelTextColor:
                                    Color.fromARGB(255, 198, 150, 5));
                            log('About us');
                          }
                        },
                        icon: Icon(
                          icon,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    txt,
                    style: GoogleFonts.sourceSansPro(),
                  ),
                ],
              );
            }),
            separatorBuilder: ((context, index) {
              return SizedBox(
                width: 20,
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              height: height / 5,
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: 30,
                    color: Color.fromARGB(255, 17, 119, 147),
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          // FlickerAnimatedText(
                          //   'Flicker Frenzy',
                          // ),
                          TyperAnimatedText('TODAY\'S LIVE PRICE',
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                // backgroundColor: Colors.purple
                              )),
                          TyperAnimatedText(dt.day.toString() +
                              '\/' +
                              dt.month.toString() +
                              '\/' +
                              dt.year.toString()),
                        ],

                        //  Duration speed = const Duration(milliseconds: 40),
                        isRepeatingAnimation: true,
                        totalRepeatCount: 500000,
                        // pause: Duration(milliseconds: 1000),
                      ),

                      //  Text(
                      //   'TODAY\'S LIVE PRICE',
                      //   style: TextStyle(color: Colors.white),
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: height / 6,
                    child: Container(
                      height: height / 6,
                      color: Color.fromARGB(255, 219, 226, 231),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('akscsproducts')
                            .snapshots(),
                        // _prodcutsStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: aKcSshimmer(),
                            );
                          }

                          if (snapshot.data!.docs.isEmpty) {
                            return const Center(child: aKcSshimmer());

                            //      Text(
                            //   'This category \n\n has no items yet !',
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //       fontSize: 26,
                            //       color: Colors.blueGrey,
                            //       fontWeight: FontWeight.bold,
                            //       fontFamily: 'Acme',
                            //       letterSpacing: 1.5),
                            // ));
                          }
                          final data = snapshot.requireData;
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemExtent: height / 40,
                              itemCount: data.size,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                    leading: Container(
                                      //color: Colors.blue,
                                      width: width / 4,
                                      child: Text(
                                          data.docs[index]['product_name'],
                                          style: TextStyle(
                                              decoration: data.docs[index]
                                                          ['stock'] ==
                                                      false
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    trailing: Text(
                                      '₹' +
                                          data.docs[index]['liveprice']
                                              .toString(),
                                      style: TextStyle(
                                          decoration:
                                              data.docs[index]['stock'] == false
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Visibility(
                                            visible: data.docs[index]
                                                    ['stock'] ==
                                                true,
                                            replacement: Text(
                                              'OUT OF STOCK',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12),
                                            ),
                                            child: Text(
                                              'STOCK',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12),
                                            )),
                                        Visibility(
                                          visible: data.docs[index]
                                                  ['liveprice'] >
                                              data.docs[index]['price'],
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                data.docs[index]['pricechange']
                                                    .toString(),
                                                style: TextStyle(
                                                  decoration: data.docs[index]
                                                              ['stock'] ==
                                                          false
                                                      ? TextDecoration
                                                          .lineThrough
                                                      : null,
                                                ),
                                              )
                                            ],
                                          ),
                                          replacement: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.remove,
                                                color: Color.fromARGB(
                                                    255, 10, 183, 21),
                                              ),
                                              Text(
                                                data.docs[index]['pricechange']
                                                    .toString(),
                                                style: TextStyle(
                                                  decoration: data.docs[index]
                                                              ['stock'] ==
                                                          false
                                                      ? TextDecoration
                                                          .lineThrough
                                                      : null,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )

                                    // Icon(data.docs[index]['liveprice'] >
                                    //         data.docs[index]['price']
                                    //     ? Icons.add
                                    //     : Icons.abc)

                                    );
                              });
                          // return GridView.builder(
                          //     physics: NeverScrollableScrollPhysics(),
                          //     gridDelegate:
                          //         const SliverGridDelegateWithFixedCrossAxisCount(
                          //             crossAxisCount: 3,
                          //             mainAxisSpacing: 6,
                          //             crossAxisSpacing: 5,
                          //             mainAxisExtent: 50),
                          //     itemCount: data.size,
                          //     itemBuilder: (context, index) {
                          //       return Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Container(
                          //           decoration: BoxDecoration(
                          //             border: Border.all(width: 0.15),
                          //             borderRadius: BorderRadius.circular(10),
                          //             //  color: Color.fromARGB(255, 255, 255, 255),
                          //           ),

                          //           // width: 164,
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.start,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.center,
                          //             children: [
                          //               Text(
                          //                 data.docs[index]['product_name'],
                          //                 // style: TextStyle(
                          //                 //   fontSize: 16,

                          //                 // ),
                          //               ),
                          //               // Text(data.docs[index]['description']),
                          //               Text(
                          //                 "₹" +
                          //                     data.docs[index]['price']
                          //                         .toString(),
                          //                 style: TextStyle(
                          //                     fontWeight: FontWeight.w200,
                          //                     fontSize: 5),
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     });
                        },
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Container(
          color: Color.fromARGB(255, 247, 242, 242),
          height: height / 2,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('akscsproducts')
                .snapshots(),
            // _prodcutsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: aKcSshimmer(),
                );
              }

              if (snapshot.data!.docs.isEmpty) {
                return const Center(child: aKcSshimmer());

                //      Text(
                //   'This category \n\n has no items yet !',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //       fontSize: 26,
                //       color: Colors.blueGrey,
                //       fontWeight: FontWeight.bold,
                //       fontFamily: 'Acme',
                //       letterSpacing: 1.5),
                // ));
              }
              final data = snapshot.requireData;
              return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 15,
                      mainAxisExtent: 200),
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return Visibility(
                      visible: data.docs[index]['stock'] == true,
                      replacement: Badge(
                        position: BadgePosition.center(),
                        animationDuration: Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,
                        badgeContent: Container(
                          color: Colors.red,
                          child: Text(
                            'OUT OF STOCK',
                            //cart.count.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.15),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent),
                            width: MediaQuery.of(context).size.width,
                            // width: 164,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.07),

                                    image: DecorationImage(
                                        opacity: 0.4,
                                        image: NetworkImage(
                                          data.docs[index]['product_image'],
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.transparent,
                                    // image: DecorationImage(
                                    //     image: NetworkImage(
                                    //         data.docs[index]['image']))
                                  ),
                                  height: height / 10,
                                  width: width / 4,
                                  // child: Image.network(
                                  //   data.docs[index]['image'],
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                Text(
                                  data.docs[index]['product_name'],

                                  // style: TextStyle(
                                  //   fontSize: 16,

                                  // ),

                                  style: GoogleFonts.aBeeZee(
                                      shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            offset: Offset(0, -5))
                                      ],
                                      color: Colors.transparent,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.black,
                                      decorationThickness: 0.25,
                                      fontSize: 20),
                                ),
                                // Text(data.docs[index]['description']),
                                Text(
                                  "₹" + data.docs[index]['price'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            double priceToDouble =
                                data.docs[index]['price'].toDouble();
                            double pricechangeToDouble =
                                data.docs[index]['pricechange'].toDouble();
                            //var myInt = int.parse(data.docs[index]['product_id']);

                            Get.to(aKcsProductDetails(
                                pricechange: pricechangeToDouble,
                                productname: data.docs[index]['product_name'],
                                description: data.docs[index]['description'],
                                liveprice:
                                    data.docs[index]['liveprice'].toDouble(),
                                image: data.docs[index]['product_image'],
                                price: priceToDouble,
                                productid: data.docs[index]['product_id']));
                          });
                          // double a = data.docs[index]['price'] == null
                          //     ? 0.0
                          //     : data.docs[index]['price'].toDouble();
                          // double cc = double.parse(
                          //     data.docs[index]['price'].toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.15),
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            width: MediaQuery.of(context).size.width,
                            // width: 164,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.07),

                                    image: DecorationImage(
                                        image: NetworkImage(
                                          data.docs[index]['product_image'],
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                    // image: DecorationImage(
                                    //     image: NetworkImage(
                                    //         data.docs[index]['image']))
                                  ),
                                  height: height / 10,
                                  width: width / 4,
                                  // child: Image.network(
                                  //   data.docs[index]['image'],
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                Text(
                                  data.docs[index]['product_name'],
                                  // style: TextStyle(
                                  //   fontSize: 16,

                                  // ),

                                  style: GoogleFonts.aBeeZee(
                                      shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            offset: Offset(0, -5))
                                      ],
                                      color: Colors.transparent,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.black,
                                      decorationThickness: 0.25,
                                      fontSize: 20),
                                ),
                                // Text(data.docs[index]['description']),
                                Text(
                                  "₹" + data.docs[index]['price'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ],
    ));
  }
}
