import 'package:flutter/material.dart';

Padding searchUI() {
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
