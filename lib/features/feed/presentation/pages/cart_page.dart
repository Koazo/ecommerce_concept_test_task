import 'package:flutter/material.dart';

int items = 0;

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final String image =
      'https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig';
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
          child: SizedBox(
            width: 37,
            height: 37,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF010035),
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        elevation: .0,
        backgroundColor: const Color(0xFFE5E5E5),
        actions: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  'Add address',
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'MarkProBold'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
                child: SizedBox(
                  width: 37,
                  height: 37,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffff6e4e),
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 35),
            child: Text(
              'My Cart',
              style: TextStyle(fontSize: 35, fontFamily: 'MarkProBold'),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF010035),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            left: 33,
                          ),
                          child: SizedBox(
                            height: 88,
                            width: 348,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    height: 89,
                                    child: Image.network(
                                      'https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, bottom: 5),
                                      width: 153,
                                      child: const Text(
                                        'Galaxy Note 20 Ultra',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      width: 153,
                                      padding: const EdgeInsets.only(left: 10),
                                      child: const Text(
                                        '\$3000.00',
                                        style: TextStyle(
                                            color: Color(0xFFFF6E4E),
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 10)),
                                Container(
                                  height: 73,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(26),
                                    color: const Color(0xFF282843),
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        count.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'MarkProBold',
                                            fontSize: 20),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count--;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Color(0xFF36364D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(color: Colors.white, height: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    height: 75,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Total',
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              '\$6,000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'MarkProBold'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Delivery',
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              'Free',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'MarkProBold'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.white, height: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 326,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFFF6E4E),
                          ),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MarkProBold',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
