import 'package:flutter/material.dart';
import 'package:testproject/widget/item_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RxInt selectedDateIndex = 0.obs;
  final RxInt selectedDateIndexNav = 0.obs;
  final RxInt selectedIndex = 0.obs;

  final List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.notifications,
    Icons.person,
  ];

  final List<String> iconNames = [
    'さがす',
    'お仕事',
    'チャット',
    'マイページ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey[300],
          ),
          child: const Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '北海道, 札幌市',
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 55,
                ),
                SizedBox(
                  height: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          DateTime.now()
                                  .add(const Duration(days: 30))
                                  .difference(DateTime.now())
                                  .inDays +
                              1,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDateIndex.value = index;
                              });
                            },
                            child: Container(
                              height: 80,
                              width: 55,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                // ignore: unrelated_type_equality_checks
                                color: selectedDateIndex == index
                                    ? Colors.amber
                                    : null,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "木",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${DateTime.now().add(Duration(days: index)).day}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => const ItemWidget(),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber, Colors.amber[100]!],
                ),
              ),
              child: Center(
                child: Text(
                  '${DateTime.now().toString().substring(0, 10)} 日（木）',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(
                Icons.location_on_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex.value,
        onTap: (index) {
          setState(() {
            selectedIndex.value = index;
          });
        },
        items: List.generate(
          icons.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(icons[index],
                // ignore: unrelated_type_equality_checks
                color: selectedIndex == index ? Colors.amber : null),
            label: iconNames[index],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Icon(Icons.qr_code_scanner_rounded),
      ),
    );
  }
}
