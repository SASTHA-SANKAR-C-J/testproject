import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: SizedBox(
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 490,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/pic1.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Center(
                                child: Text(
                                  "介護付き有料老人ホーム",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                              height: 30,
                              width: 160,
                              decoration: BoxDecoration(
                                color: Colors.amber[50],
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Text(
                              "¥ 6,000",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("5月 31日（水）08 : 00 ~ 17 : 00"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("北海道札幌市東雲町3丁目916番地17号"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("交通費 300円"),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "住宅型有料老人ホームひまわり倶楽部",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.grey[400],
                              size: 33,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 215,
                left: 0,
                child: Container(
                  height: 25,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "hello ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
