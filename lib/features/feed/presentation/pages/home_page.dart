import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
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
      ),
      backgroundColor: AppColors.backgroundColor,
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
    );
  }
}

int bottomNavIndex = 0;

int items = 0;

Widget bottomNav() {
  return GNav(
    selectedIndex: bottomNavIndex,
    onTabChange: (index) {},
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
        text: items.toString(),
        textColor: Colors.white,
        onPressed: () {},
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
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}
