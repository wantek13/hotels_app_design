import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotels_app/calendar_page.dart';

const d_green = Color(0xFF54D3C2);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels App',
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchSection(),
            HotelSection()
          ],
        ),
      )
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed: null,
      ),
      title: Text(
        "Explore",
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w800
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
      ],
      backgroundColor: Colors.white,
      centerTitle: true,

    );
  }
}

class SearchSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 3)
                      )
                    ]
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'London',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none
                    ),
                  ),

                )
              ),
              SizedBox(width: 10,),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 3)
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return CalendarPage();
                            }
                        )
                    );
                  },
                  child: Icon(
                    Icons.search,
                    size: 26,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                    primary: d_green
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose date",
                      style: GoogleFonts.nunito(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "12 Dec - 22 Dec",
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Number of Rooms",
                      style: GoogleFonts.nunito(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "1 Room - 2 Adults",
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HotelSection extends StatelessWidget {

  final List hotelList = [
    {
      'title':'Grand Royal Hotel',
      'place':'London',
      'distance':2,
      'review':36,
      'picture':'images/hotel1.jpeg',
      'price':180,
    },
    {
      'title':'California Hotel',
      'place':'Berlin',
      'distance':0.5,
      'review':85,
      'picture':'images/hotel2.jpg',
      'price':320,
    },
    {
      'title':'Excalibur',
      'place':'Panama',
      'distance':5,
      'review':34,
      'picture':'images/hotel3.jpg',
      'price':220,
    },
    {
      'title':'Luxurian Straight Hotel',
      'place':'Bora Bora',
      'distance':12,
      'review':74,
      'picture':'images/hotel4.jpg',
      'price':332,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "550 hotels founds",
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 15
                ),
              ),
              Row(
                children: [
                  Text(
                    "Filters",
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list_outlined,
                        color: d_green,
                        size: 25,
                      ))
                ],
              )
            ],
          ),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList(),
          )
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;

  HotelCard(this.hotelData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 230,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(18)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3)
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage(
                  hotelData['picture'],
                ),
                fit: BoxFit.cover
              )
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: -15,
                  child: MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: d_green,
                      size: 20,
                    ),
                  )
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hotelData['title'],
                        style: GoogleFonts.nunito(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '\$' + hotelData['price'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hotelData['place'],
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.place,
                            color: d_green,
                            size: 15,
                          ),
                          Text(
                            hotelData['distance'].toString() + ' km to city',
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "/per night",
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate,
                            color: d_green,
                            size: 14,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: d_green,
                            size: 14,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: d_green,
                            size: 14,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: d_green,
                            size: 14,
                          ),
                          Icon(
                            Icons.star_rate_outlined,
                            color: d_green,
                            size: 14,
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Text(
                          hotelData['review'].toString() + ' reviews',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}





