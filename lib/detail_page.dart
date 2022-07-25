import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_page.dart';
import 'package:flutter_application_1/detail_info.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7, initialPage: 999);
    detailInfo = getDetailInfo();
  }

  int pagePosition = 999;
  int activePage = 999;
  double rating = 4.5;
  late Future<DetailInfo> detailInfo;
  List<String> images = [
    'https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both',
    'https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg',
    'https://static.digit.in/default/942998b8b4d3554a6259aeb1a0124384dbe0d4d5.jpeg'
  ];
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 3,
      vsync: this,
    );
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
                primary: const Color(0xFF010035),
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
        centerTitle: true,
        title: const Center(
          child: Text(
            'Product Details',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        backgroundColor: const Color(0xFFE5E5E5),
        actions: [
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
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FutureBuilder<DetailInfo>(
          future: detailInfo,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffff6e4e),
                ),
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView.builder(
                      controller: _pageController,
                      pageSnapping: true,
                      onPageChanged: (page) {
                        setState(() {
                          activePage = page;
                        });
                      },
                      itemBuilder: (context, pagePosition) {
                        bool active = pagePosition == activePage;
                        return slider(snapshot.data!.images!, pagePosition,
                            active, snapshot.data!.images!.length);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              left: 20,
                              top: 20,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  snapshot.data!.title!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFF010035),
                                        padding: const EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: snapshot.data!.isFavorites!
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.redAccent,
                                              size: 18,
                                            )
                                          : const Icon(
                                              Icons.favorite_border,
                                              color: Colors.redAccent,
                                              size: 18,
                                            )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: StarRating(
                              rating: snapshot.data!.rating!.toDouble(),
                              onRatingChanged: (rating) =>
                                  setState(() => this.rating = rating),
                              color: const Color(0xFFFFB800),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: TabBar(
                              controller: _tabController,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: const Color(0xFFFF6E4E),
                              tabs: const [
                                Tab(
                                  child: Text(
                                    'Shop',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'MarkProBold',
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Detail',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Features',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Icon(
                                            Icons.memory,
                                            color: Color(0xFFB7B7B7),
                                            size: 28,
                                          ),
                                          Text(
                                            snapshot.data!.cPU.toString(),
                                            style: const TextStyle(
                                                color: Color(0xFFB7B7B7),
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Icon(
                                            Icons.camera_alt_outlined,
                                            color: Color(0xFFB7B7B7),
                                            size: 28,
                                          ),
                                          Text(
                                            snapshot.data!.camera.toString(),
                                            style: const TextStyle(
                                                color: Color(0xFFB7B7B7),
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Icon(
                                            Icons.memory_outlined,
                                            color: Color(0xFFB7B7B7),
                                            size: 28,
                                          ),
                                          Text(
                                            snapshot.data!.ssd.toString(),
                                            style: const TextStyle(
                                                color: Color(0xFFB7B7B7),
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Icon(
                                            Icons.sd_card_outlined,
                                            color: Color(0xFFB7B7B7),
                                            size: 28,
                                          ),
                                          Text(
                                            snapshot.data!.sd.toString(),
                                            style: const TextStyle(
                                                color: Color(0xFFB7B7B7),
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    'Soon',
                                    style: TextStyle(
                                        fontSize: 30, color: Color(0xFFB7B7B7)),
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    'Soon',
                                    style: TextStyle(
                                        fontSize: 30, color: Color(0xFFB7B7B7)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 145,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Select color and capacity',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 39.29,
                                        width: 39.29,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: HexColor(
                                              snapshot.data!.color!.first),
                                        ),
                                        child: const Icon(
                                          Icons.check_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Container(
                                        height: 39.29,
                                        width: 39.29,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: HexColor(
                                            snapshot.data!.color![1],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    const Color(0xffff6e4e))),
                                        child: Text(
                                            '${snapshot.data!.capacity!.first} GB'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${snapshot.data!.capacity![1]} GB',
                                        style: const TextStyle(
                                            color: Color(0xFF8D8D8D)),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 335,
                                    height: 44,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pop(context);
                                          items++;
                                        });
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color(0xffff6e4e))),
                                      child: Text(
                                        'Add to Cart                 \$${snapshot.data!.price}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'MarkProBold',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Widget slider(images, pagePosition, active, length) {
  double margin = active ? 10 : 40;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(2, 4),
        )
      ],
      image: DecorationImage(
          image: NetworkImage(
            images[pagePosition % length],
          ),
          fit: BoxFit.fill),
    ),
  );
}

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
