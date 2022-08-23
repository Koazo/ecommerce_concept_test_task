import 'package:flutter/material.dart';

class ShopFilter extends StatefulWidget {
  const ShopFilter({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  State<ShopFilter> createState() => _ShopFilterState();
}

class _ShopFilterState extends State<ShopFilter> {
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
