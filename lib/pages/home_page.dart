import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flowershop/pages/cart_page.dart';
import 'package:flowershop/pages/customize_page.dart';
import 'package:flowershop/pages/gallery_page.dart';
import 'package:flowershop/pages/notif_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex){
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomizePage()));
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        case 3:
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotifPage()));
      }
    });
  }

  final TextEditingController searchbar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple, // Highlighted item color
        unselectedItemColor: Colors.grey, // Unselected item color
        onTap: _onItemTapped, // Handle tap
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Gallery",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize),
            label: "Customize",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Checkout",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
        ],
      ),
      body: ListView(

        padding: EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Text("Rizza FlowerShop",
              style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color.fromRGBO(190, 54, 165, 1)
              ),),
              Padding(padding: EdgeInsets.only(left: 90)),
              Icon(Icons.notifications,
              color: Color.fromRGBO(190, 54, 165, 1),),
              Padding(padding: EdgeInsets.only(left: 10)),
              Icon(Icons.shopping_cart,
              color: Color.fromRGBO(190, 54, 165, 1),),
              Padding(padding: EdgeInsets.only(left: 10)),
              Icon(Icons.search,
              color: Color.fromRGBO(190, 54, 165, 1),)
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Text("Shop Our Best",
          style: GoogleFonts.merriweather(
            fontWeight: FontWeight.bold,
            fontSize: 40
          ),),
          Text("Sellers",
          style: GoogleFonts.merriweather(
            fontWeight: FontWeight.bold,
            fontSize: 40
          ),),
          Padding(padding:
           EdgeInsets.only(
              top: 10,
           ),
          child: TextField(
            controller: searchbar,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1,color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
              ),
              prefixIcon: Icon(Icons.search),
              filled: true,
              hintText: "what do you want to find?",
              hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.normal,
                fontSize: 16
              ),
              fillColor: Color.fromRGBO(255, 255, 255, 1)
            ),
          ),
          ),
          Padding(padding: EdgeInsets.only(top: 40)),
          Text("Event Categories",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),),
          Padding(padding: EdgeInsets.only(top: 10)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  side: BorderSide(width: 1,color: Colors.grey),
                  fixedSize: Size(95, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
                child: Text("Text")),
                Padding(padding: EdgeInsets.only(left: 10)),
                ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  side: BorderSide(width: 1,color: Colors.grey),
                  fixedSize: Size(95, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
                child: Text("Text")),
                Padding(padding: EdgeInsets.only(left: 10)),
                ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  side: BorderSide(width: 1,color: Colors.grey),
                  fixedSize: Size(95, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
                child: Text("Text")),
                Padding(padding: EdgeInsets.only(left: 10)),
                ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  side: BorderSide(width: 1,color: Colors.grey),
                  fixedSize: Size(95, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
                child: Text("Text")),
                Padding(padding: EdgeInsets.only(left: 10)),
                ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  side: BorderSide(width: 1,color: Colors.grey),
                  fixedSize: Size(95, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
                child: Text("Text")),
                Padding(padding: EdgeInsets.only(left: 10)),
                
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            children: [
              Image.asset("lib/assets/images/Frame1.png")
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Card(
            elevation: 0,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Image.asset(
                    "lib/assets/images/redrose.png"
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    SizedBox(
                      width: 200,
                      height: 90,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("Boquet no.1",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text("Medium to Large size with premium sick\ngold and free greeting card",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w300
                        ),),
                        Text("₱ 650.00 PHP",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(
                          width: 80,
                          height: 22,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color.fromRGBO(190, 54, 165, 1), width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                            minimumSize: Size(1, 5),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Shop Now',
                            style: GoogleFonts.averiaSerifLibre(
                            color: Color.fromRGBO(190, 54, 165, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w300
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Image.asset(
                    "lib/assets/images/whiterose.png"
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    SizedBox(
                      width: 200,
                      height: 90,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("Boquet no.1",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text("Medium to Large size with premium sick\ngold and free greeting card",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w300
                        ),),
                        Text("₱ 650.00 PHP",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(
                          width: 80,
                          height: 22,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color.fromRGBO(190, 54, 165, 1), width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                            minimumSize: Size(1, 5),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Shop Now',
                            style: GoogleFonts.averiaSerifLibre(
                            color: Color.fromRGBO(190, 54, 165, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w300
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Image.asset(
                    "lib/assets/images/redrose.png"
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    SizedBox(
                      width: 200,
                      height: 90,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("Boquet no.1",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text("Medium to Large size with premium sick\ngold and free greeting card",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w300
                        ),),
                        Text("₱ 650.00 PHP",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(
                          width: 80,
                          height: 22,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color.fromRGBO(190, 54, 165, 1), width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                            minimumSize: Size(1, 5),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Shop Now',
                            style: GoogleFonts.averiaSerifLibre(
                            color: Color.fromRGBO(190, 54, 165, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w300
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Image.asset(
                    "lib/assets/images/whiterose.png"
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    SizedBox(
                      width: 200,
                      height: 90,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("Boquet no.1",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text("Medium to Large size with premium sick\ngold and free greeting card",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w300
                        ),),
                        Text("₱ 650.00 PHP",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(
                          width: 80,
                          height: 22,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color.fromRGBO(190, 54, 165, 1), width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                            minimumSize: Size(1, 5),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Shop Now',
                            style: GoogleFonts.averiaSerifLibre(
                            color: Color.fromRGBO(190, 54, 165, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w300
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                Row(
                  children: [
                    Text("Gallery",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 210)),
                    TextButton(
                      onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryPage()))},
                      child: Text("view all",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset("lib/assets/images/rainbowrose.png"),
                    Padding(padding: EdgeInsets.only(left: 25)),
                    Image.asset("lib/assets/images/smallvase.png")
                  ],
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}
