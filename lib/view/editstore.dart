import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testproject/controller/editstore.dart';

class EditStoreProfileScreen extends StatelessWidget {
  const EditStoreProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    EditStoreProfileController controller =
        Get.find<EditStoreProfileController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.notification_add_outlined,
              size: 30,
            ),
          )
        ],
        centerTitle: true,
        title: const Text('店舗プロフィール編集'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "店舗名",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'Mer キッチン',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "代表担当者名",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: '林田　絵梨花',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "店舗電話番号",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: '123 - 4567 8910',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "店舗住所",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: '大分県豊後高田市払田791-13',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              child: GoogleMap(
                onMapCreated: (controller) {
                  Get.find<EditStoreProfileController>().mapController =
                      controller;
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 12.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "店舗外観*（最大3枚まで）",
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            buildImageRow(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "店舗内観 1枚〜3枚ずつ追加してください",
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            buildImageRow(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "料理写真*(1枚〜3枚ずつ追加してください)",
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            buildImageRow(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "メニュー写真*(1枚〜3枚ずつ追てください)",
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            buildImageRow(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "営業時間",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: GetBuilder<EditStoreProfileController>(
                      builder: (controller) {
                        return InkWell(
                          onTap: () => controller.selectStartTime(context),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              controller.startTime.value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "~",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Expanded(
                    child: GetBuilder<EditStoreProfileController>(
                      builder: (controller) {
                        return InkWell(
                          onTap: () => controller.selectEndTime(context),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              controller.endTime.value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "ランチ時間*",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: GetBuilder<EditStoreProfileController>(
                      builder: (controller) {
                        return InkWell(
                          onTap: () => controller.selectStartTime(context),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              controller.startTime.value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "~",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Expanded(
                    child: GetBuilder<EditStoreProfileController>(
                      builder: (controller) {
                        return InkWell(
                          onTap: () => controller.selectEndTime(context),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              controller.endTime.value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "定休日",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GetBuilder<EditStoreProfileController>(
                builder: (controller) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildCheckBoxWithText('月', controller.checkbox1),
                          buildCheckBoxWithText('火', controller.checkbox2),
                          buildCheckBoxWithText('水', controller.checkbox3),
                          buildCheckBoxWithText('木', controller.checkbox4),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildCheckBoxWithText('金', controller.checkbox5),
                          buildCheckBoxWithText('土', controller.checkbox6),
                          buildCheckBoxWithText('日', controller.checkbox7),
                          buildCheckBoxWithText('祝', controller.checkbox8),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "予算",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: GetBuilder<EditStoreProfileController>(
                      builder: (controller) {
                        return TextField(
                          controller: controller.amount1Controller.value,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: '¥ 1,000',
                          ),
                        );
                      },
                    ),
                  ),
                  const Text(
                    " ~ ",
                    style: TextStyle(fontSize: 30),
                  ),
                  Expanded(
                    child: GetBuilder<EditStoreProfileController>(
                      builder: (controller) {
                        return TextField(
                          controller: controller.amount2Controller.value,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: '¥ 2,000',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "キャッチコピー",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: '美味しい！リーズナブルなオムライスランチ！',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "座席数",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: '40席',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "喫煙席",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<EditStoreProfileController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildCheckBoxWithText(
                        '有',
                        controller.checkbox9,
                      ),
                      buildCheckBoxWithText(
                        '無',
                        controller.checkbox10,
                      ),
                    ],
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "駐車場",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<EditStoreProfileController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildCheckBoxWithText(
                        '有',
                        controller.checkbox11,
                      ),
                      buildCheckBoxWithText(
                        '無',
                        controller.checkbox12,
                      ),
                    ],
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "来店プレゼント",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<EditStoreProfileController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildCheckBoxWithText(
                        '有（最大３枚まで）',
                        controller.checkbox13,
                      ),
                      buildCheckBoxWithText(
                        '無',
                        controller.checkbox14,
                      ),
                    ],
                  );
                },
              ),
            ),
            buildImageRow(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "来店プレゼント名",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'いちごクリームアイスクリーム, ジュース',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange),
                child: const Center(
                    child: Text(
                  "編集を保存",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImageContainer(int index) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GetBuilder<EditStoreProfileController>(
        builder: (controller) {
          return controller.selectedImages[index]?.isNotEmpty ?? false
              ? Image.file(
                  File(controller.selectedImages[index]!),
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/Input.png',
                  fit: BoxFit.cover,
                );
        },
      ),
    );
  }

  Widget buildImagePickerButton() {
    return InkWell(
      onTap: () {
        Get.find<EditStoreProfileController>().pickImage(2);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: GetBuilder<EditStoreProfileController>(
          builder: (controller) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image,
                  size: 40,
                  color: Colors.grey,
                ),
                Text(
                  '写真を追加',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Padding buildImageRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildImageContainer(0),
          buildImageContainer(1),
          buildImagePickerButton(),
        ],
      ),
    );
  }

  Widget buildCheckBoxWithText(
    String text,
    RxBool value,
  ) {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            activeColor: Colors.orange,
            value: value.value,
            onChanged: (bool? newValue) {
              if (newValue != null) {
                value.value = newValue;
              }
            },
          ),
          Text(text),
        ],
      ),
    );
  }
}
