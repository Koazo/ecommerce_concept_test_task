import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int bottomNavIndex = 0;
    int items = 0;
    return Container(
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
        child: GNav(
          selectedIndex: bottomNavIndex,
          onTabChange: (index) {},
          backgroundColor: const Color(0xff010035),
          color: Colors.white,
          curve: Curves.fastOutSlowIn,
          tabs: [
            GButton(
              icon: Icons.circle,
              iconSize: 15,
              textColor: Colors.white,
              text: 'Explorer',
              gap: 0,
              onPressed: () {},
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: items.toString(),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            const GButton(
              icon: Icons.favorite_border_outlined,
            ),
            const GButton(
              icon: Icons.person_outline,
            ),
          ],
        ),
      ),
    );
  }
}
