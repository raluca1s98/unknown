import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'elementpagedetail.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ElementMainPage(),
    );
  }
}

class ElementMainPage extends StatefulWidget {
  @override
  _ElementMainPageState createState() => _ElementMainPageState();
}

class _ElementMainPageState extends State<ElementMainPage> {
  PageController _pageController = PageController(viewportFraction: 0.7);
  double _indicatorHeight = 35.45;
  int _pageIndex = 0;

  List<String> _heroTag = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List<String> _heroTextTag = List.generate(10, (index) => "t$index");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    _indicatorHeight = MediaQuery.of(context).size.height / 2.6 / 8;
//    print(MediaQuery.of(context).size.height / 2.6 / 8);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "#Letsknoweachotherbetter",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.search,
                                size: 18,
                              ),
                            ),
                          ),
                          IconButton(icon: Icon(Icons.list), onPressed: () {})
                        ],
                      ),
                      Text(
                        "Unknown",
                        style: TextStyle(fontSize: 38),
                      ),
                      Text(
                        "questions",
                        style: TextStyle(
                            fontSize: 38, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 8,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "01",
                              style: TextStyle(
                                  color: Colors.indigoAccent[700],
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                width: 6,
                                height:
                                    MediaQuery.of(context).size.height / 2.6,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(8)),
                                child: Stack(
                                  children: [
                                    AnimatedContainer(
                                      height: _indicatorHeight,
                                      decoration: BoxDecoration(
                                          color: Colors.indigoAccent[700],
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "08",
                              style: TextStyle(
                                  color: Colors.indigoAccent[700],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 8,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 160,
                              top: 0,
                              child: PageView.builder(
                                controller: _pageController,
                                onPageChanged: (value) {
                                  setState(() {
                                    _pageIndex = value + 1;
                                    if (value == 0) {
                                      _indicatorHeight =
                                          MediaQuery.of(context).size.height /
                                              2.6 /
                                              8;
                                    } else {
                                      _indicatorHeight =
                                          MediaQuery.of(context).size.height /
                                              2.6 /
                                              8 *
                                              (value + 1);
                                    }
                                    print(_indicatorHeight);

                                    print(value.toString());
                                  });
                                },
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ElementDetailPage(
                                                      _heroTag[index],
                                                      _heroTextTag[index])));
                                    },
                                    child: Hero(
                                      tag: _heroTag[index],
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 16, right: 16, bottom: 24),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  spreadRadius: -4,
                                                  blurRadius: 4,
                                                  offset: Offset(-4, 24))
                                            ],
                                            color: Colors.indigoAccent[700],
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://i.pinimg.com/564x/f9/54/87/f95487ddee97d480f621aa27fc924443.jpg"),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Spacer(),
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                child: Text(
                                                  "21",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "question to ask",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Unknown Stage",
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              right: 16,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "0$_pageIndex",
                                        style: TextStyle(
                                            color: Colors.indigoAccent[700],
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("/09"),
                                      Spacer(),
                                      Container(
                                        height: 28,
                                        width: 64,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.indigoAccent[700]),
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "See all",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    Colors.indigoAccent[700]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 72,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 54,
                                              width: 54,
                                              decoration: BoxDecoration(
                                                  color:
                                                      Colors.indigoAccent[700],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                            ),
                                            Text(
                                              "Unknown",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Colors.indigoAccent[700],
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 54,
                                              width: 54,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                            ),
                                            Text(
                                              "Friends",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 54,
                                              width: 54,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                            ),
                                            Text(
                                              "Lovers",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 54,
                                              width: 54,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                            ),
                                            Text(
                                              "Stranger",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 54,
                                              width: 54,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                            ),
                                            Text(
                                              "Enemy",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
