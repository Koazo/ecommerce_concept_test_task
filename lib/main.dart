import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_page.dart';
import 'package:flutter_application_1/detail_page.dart';
import 'package:flutter_application_1/phones.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Color(0xffff6e4e)),
        fontFamily: 'MarkPro',
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/detail_page': (BuildContext context) => DetailPage(),
        '/cart': (context) => Cart(),
        '/main': (context) => MyApp(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    phones = getPhones();
    _pageController = PageController(viewportFraction: 1);
  }

  late PageController _pageController;
  int activePage = 1;
  bool _favoriteItem = false;
  late Future<List<Phones>> phones;
  int? _currentIndex;
  List<CategoryModel> categoriesList = [
    CategoryModel('Phones', Icons.smartphone, true),
    CategoryModel('Computer', Icons.desktop_windows, false),
    CategoryModel('Health', Icons.monitor_heart, false),
    CategoryModel('Books', Icons.book_sharp, false),
  ];
  List<String> images = [
    'https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both',
    'https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg',
    'https://static.digit.in/default/942998b8b4d3554a6259aeb1a0124384dbe0d4d5.jpeg'
  ];

  List<CategoryModel> selectedCategory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: bottomNav(),
        ),
      ),
      // BottomSheetWidget(
      //   onClickedClose: () {},
      //   onClickedComfirm: () {},
      //   title: 'Filter options',
      // ),
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            selectCategories(),
            categories(),
            search(),
            hotSales(),
            hotSalesCarousel(),
            bestSeller(),
            const SizedBox(
              height: 5,
            ),
            bestSellerGrid(context)
          ],
        ),
      ),
    );
  }

  Widget categories() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return categoryItem(
            categoriesList[index].text,
            categoriesList[index].icon,
            categoriesList[index].isSelected,
            index,
          );
        },
      ),
    );
  }

  Widget categoryItem(String text, IconData icon, bool isSelected, int index) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: isSelected ? const Color(0xffff6e4e) : Colors.white,
              shape: const CircleBorder(),
              elevation: .0,
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () => setState(() {
              for (var i = 0; i < categoriesList.length; i++) {
                categoriesList[i].isSelected = false;
              }
              categoriesList[index].isSelected =
                  !categoriesList[index].isSelected;
            }),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
              size: 35,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Padding selectCategories() {
    return Padding(
      padding: const EdgeInsets.only(top: 2.5, left: 17, bottom: 5),
      child: Row(
        children: [
          const Text(
            'Select Category',
            style: TextStyle(fontSize: 26, fontFamily: 'MarkProBold'),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'view all',
                style: TextStyle(color: Color(0xffff6e4e), fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bestSellerGrid(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.4,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      children: List.generate(5, (index) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, '/detail_page');
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        'https://www.benchmark.rs/assets/img/news/edge1.jpg',
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      Align(
                        alignment: const Alignment(1.5, 1),
                        child: RawMaterialButton(
                            elevation: 2.0,
                            fillColor: Colors.white,
                            padding: const EdgeInsets.all(5.0),
                            shape: const CircleBorder(),
                            onPressed: () {
                              setState(() {
                                _currentIndex = index;
                                _favoriteItem = !_favoriteItem;
                              });
                            },
                            child: _currentIndex == index && _favoriteItem
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, right: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          '\$1,047  ',
                          style: TextStyle(
                            fontFamily: 'MarkProBold',
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '\$1,500',
                          style: TextStyle(
                              fontFamily: 'MarkProBold',
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                              color: Color(0xFFCCCCCC)),
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Motorola One Edge',
                      style: TextStyle(
                        fontFamily: 'MarkPro',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Padding bestSeller() {
    return Padding(
      padding: const EdgeInsets.only(top: 2.5, left: 17),
      child: Row(
        children: [
          const Text(
            'Best Seller',
            style: TextStyle(fontSize: 26, fontFamily: 'MarkProBold'),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'see more',
                style: TextStyle(color: Color(0xffff6e4e), fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget hotSalesCarousel() {
    return SizedBox(
      height: 182,
      child: FutureBuilder<List<Phones>>(
        future: phones,
        builder: (context, snapshot) {
          return PageView.builder(
            itemCount: images.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 182,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        images[pagePosition],
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                  pagePosition != 1
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 35,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xFFFF6E4E),
                                ),
                                height: 40,
                                width: 40,
                                child: const Center(
                                  child: Text(
                                    'New',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'MarkProBold',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              const Text(
                                'Iphone 12',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'MarkProBold'),
                              ),
                              const Text(
                                'Súper. Mega. Rápido.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.only(left: 30, right: 30),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Buy now!',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'MarkProBold',
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 35, bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.only(left: 30, right: 30),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Buy now!',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'MarkProBold',
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Padding hotSales() {
    return Padding(
      padding: const EdgeInsets.only(top: 2.5, left: 17),
      child: Row(
        children: [
          const Text(
            'Hot Sales',
            style: TextStyle(fontSize: 26, fontFamily: 'MarkProBold'),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'see more',
                style: TextStyle(color: Color(0xffff6e4e), fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding search() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              height: 45,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 12),
                    child: Icon(
                      Icons.search_rounded,
                    ),
                  ),
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ClipOval(
            child: Material(
              color: const Color(0xffff6e4e), // Button color
              child: InkWell(
                splashColor: Colors.red, // Splash color
                onTap: () {},
                child: const SizedBox(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Icons.qr_code,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      elevation: .0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.location_on_outlined,
            color: Color(0xffff6e4e),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Moscow, Russia',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.grey,
          )
        ],
      ),
      backgroundColor: const Color(0xFFE5E5E5),
      actions: [
        FilterButton(context: context),
      ],
    );
  }

  int bottomNavIndex = 0;

  Widget bottomNav() {
    return GNav(
      selectedIndex: bottomNavIndex,
      onTabChange: (index) {
        setState(() {
          bottomNavIndex = index;
        });
      },
      backgroundColor: const Color(0xff010035),
      color: Colors.white,
      curve: Curves.fastOutSlowIn,
      tabs: [
        const GButton(
          icon: Icons.circle,
          iconSize: 15,
          textColor: Colors.white,
          text: 'Explorer',
          gap: 0,
        ),
        GButton(
          icon: Icons.shopping_bag_outlined,
          onPressed: () {
            setState(() {
              Navigator.pushNamed(context, '/cart');
            });
          },
        ),
        const GButton(
          icon: Icons.favorite_border_outlined,
        ),
        const GButton(
          icon: Icons.person_outline,
        ),
      ],
    );
  }
}

class CategoryModel {
  String text;
  IconData icon;
  bool isSelected;

  CategoryModel(this.text, this.icon, this.isSelected);
}

class FilterButton extends StatefulWidget {
  const FilterButton({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  final items1 = ['Samsung'];
  final items2 = [
    '\$0 - \$10000',
  ];
  final items3 = [
    '4.5 to 5.5 inches',
  ];
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/icons/funnel.png', height: 16),
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          context: context,
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 37,
                        height: 37,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF010035),
                            padding: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                      const Text(
                        'Filter options',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffff6e4e),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Done',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Brand',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFB3B3B3),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: items1.first,
                            items: items1.map(buildMenuItem).toList(),
                            onChanged: (String? value) {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFFB3B3B3),
                              size: 30,
                            ),
                            isExpanded: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFB3B3B3),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: items2.first,
                            items: items2.map(buildMenuItem).toList(),
                            onChanged: (String? value) {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFFB3B3B3),
                              size: 30,
                            ),
                            isExpanded: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFB3B3B3),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: items3.first,
                            items: items3.map(buildMenuItem).toList(),
                            onChanged: (String? value) {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFFB3B3B3),
                              size: 30,
                            ),
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  final String title;
  final VoidCallback onClickedComfirm;
  final VoidCallback onClickedClose;

  const BottomSheetWidget({
    Key? key,
    required this.title,
    required this.onClickedComfirm,
    required this.onClickedClose,
  }) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildButtons(),
        ],
      ),
    );
  }

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 37,
            height: 37,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF010035),
                  padding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 22,
                )),
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: widget.onClickedComfirm,
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffff6e4e),
              padding: const EdgeInsets.only(left: 20, right: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Done',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      );
}
