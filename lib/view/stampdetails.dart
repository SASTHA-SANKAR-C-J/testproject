import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/widget/customicon.dart';

class StampDetailsController extends GetxController {
  RxInt selectedPageIndex = 0.obs;
  RxInt selectedCardIndex = 0.obs;
}

class StampDetailsScreen extends StatelessWidget {
  final StampDetailsController controller = Get.put(StampDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa8b1ff),
      appBar: AppBar(
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(7.0),
          child: CircleAvatar(
            backgroundColor: Color(0xff949ffe),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        backgroundColor: const Color(0xffa8b1ff),
        actions: const [
          Icon(
            Icons.remove_circle_outline_outlined,
            size: 35,
            color: Colors.white,
          ),
          SizedBox(
            width: 7,
          )
        ],
        title: const Text(
          'スタンプカード詳細',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: const Color(0xffa8b1ff),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mer キッチン",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "現在の獲得数 30 個",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.768,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 6,
                                offset: const Offset(
                                  0,
                                  3,
                                ),
                              ),
                            ],
                          ),
                          width: MediaQuery.of(context).size.width * 0.82,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                ],
                              ),
                              Row(
                                children: [
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                ],
                              ),
                              Row(
                                children: [
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 6,
                                offset: const Offset(
                                  0,
                                  3,
                                ),
                              ),
                            ],
                          ),
                          width: MediaQuery.of(context).size.width * 0.85,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                ],
                              ),
                              Row(
                                children: [
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                ],
                              ),
                              Row(
                                children: [
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                  StarTickIcon(),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text("2 / 2枚目"),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "スタンプ獲得履歴",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.735,
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title: Text(
                          "2021 / 11 / 18",
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text("スタンプを獲得しました。"),
                        trailing: Text("1 個"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
