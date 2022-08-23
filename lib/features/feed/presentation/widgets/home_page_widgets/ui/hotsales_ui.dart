import 'package:flutter/material.dart';

Padding hotSalesUI() {
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
