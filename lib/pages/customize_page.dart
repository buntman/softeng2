import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flowershop/pages/cart_page.dart';
import 'package:flowershop/pages/home_page.dart';
import 'package:flowershop/pages/notif_page.dart';

class CustomizePage extends StatefulWidget {
  const CustomizePage({super.key});

  @override
  State<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {

  
  int _price = 0;
  int _time =0;
  int _counter = 0;
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) {
        _counter = 0;
      }else{
        _counter --;
      }
    });
  }

  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  void _decrementCounter1() {
    setState(() {
      if (_counter1 == 0) {
        _counter1 = 0;
      }else{
        _counter1 --;
      }
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }

  void _decrementCounter2() {
    setState(() {
      if (_counter2 == 0) {
        _counter2 = 0;
      }else{
        _counter2 --;
      }
    });
  }

  void _incrementCounter3() {
    setState(() {
      _counter3++;
    });
  }

  void _decrementCounter3() {
    setState(() {
      if (_counter3 == 0) {
        _counter3 = 0;
      }else{
        _counter3 --;
      }
    });
  }

  int _selectedIndex = 1;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rizza FlowerShop",
              style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color.fromRGBO(190, 54, 165, 1)
              ),),
              Padding(padding: EdgeInsets.only(left: 10)),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications, color: Color.fromRGBO(190, 54, 165, 1),),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: Color.fromRGBO(190, 54, 165, 1),),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Color.fromRGBO(190, 54, 165, 1),),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 40)),
          Text("Custom Boquet Builder",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            color: Color.fromRGBO(255, 227, 235, 1),
            padding: EdgeInsets.all(30),
            height: 350,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Size",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(250, 34, 144, 1),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(250, 34, 144, 1)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(width: 1,color: Colors.grey)),
                          elevation: 0,
                          onPressed: _incrementCounter,
                          tooltip: 'Increment',
                          child: Icon(Icons.add),
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("$_counter",
                        style: GoogleFonts.inter(
                          fontSize: 16
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: BorderSide(width: 1,color: Colors.grey)),
                          elevation: 0,
                          onPressed: _decrementCounter,
                          tooltip: 'decrement',
                          child: Icon(Icons.remove),
                        ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            color: Color.fromRGBO(255, 227, 235, 1),
            padding: EdgeInsets.all(30),
            height: 350,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Flowers",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(250, 34, 144, 1),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(250, 34, 144, 1)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(width: 1,color: Colors.grey)),
                          elevation: 0,
                          onPressed: _incrementCounter1,
                          tooltip: 'Increment',
                          child: Icon(Icons.add),
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("$_counter1",
                        style: GoogleFonts.inter(
                          fontSize: 16
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: BorderSide(width: 1,color: Colors.grey)),
                          elevation: 0,
                          onPressed: _decrementCounter1,
                          tooltip: 'decrement',
                          child: Icon(Icons.remove),
                        ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            color: Color.fromRGBO(255, 227, 235, 1),
            padding: EdgeInsets.all(30),
            height: 350,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Package",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(250, 34, 144, 1),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(250, 34, 144, 1)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(width: 1,color: Colors.grey)),
                          elevation: 0,
                          onPressed: _incrementCounter2,
                          tooltip: 'Increment',
                          child: Icon(Icons.add),
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("$_counter2",
                        style: GoogleFonts.inter(
                          fontSize: 16
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: BorderSide(width: 1,color: Colors.grey)),
                          elevation: 0,
                          onPressed: _decrementCounter2,
                          tooltip: 'decrement',
                          child: Icon(Icons.remove),
                        ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    viewportFraction: 0.8,
                  ),
                ),
                Text("data"),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            color: Color.fromRGBO(255, 227, 235, 1),
            padding: EdgeInsets.all(30),
            height: 350,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cards",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(250, 34, 144, 1),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(250, 34, 144, 1)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(width: 1,color: Colors.grey)),
                          elevation: 0,
                          onPressed: _incrementCounter3,
                          tooltip: 'Increment',
                          child: Icon(Icons.add),
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("$_counter3",
                        style: GoogleFonts.inter(
                          fontSize: 16
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: BorderSide(width: 1,color: Colors.grey)),
                          elevation: 0,
                          onPressed: _decrementCounter3,
                          tooltip: 'decrement',
                          child: Icon(Icons.remove),
                        ),
                        ),
                      ],
                    )
    
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/redrose.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            children: [
              Text("Price:",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
              Padding(padding: EdgeInsets.only(left: 230)),
              Text("$_price PHP",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),)
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            children: [
              Text("Estimated Time:",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
              Padding(padding: EdgeInsets.only(left: 100)),
              Text("$_time minutes",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),)
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            children: [
              SizedBox(
                width: 130,
                height: 50,
                child: ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(190, 54, 165, 1),
                  side: BorderSide(width: 1, color: Color.fromRGBO(190, 54, 165, 1)),
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                  )
                ),
                child: Text("Add to cart",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white,
                ),)),),
              Padding(padding: EdgeInsets.only(left: 35)),
              SizedBox(
                width: 196,
                height: 50,
                child: ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  side: BorderSide(width: 1,color: Color.fromRGBO(190, 54, 165, 1)),
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                  )
                ),
                child: Text("Make a new Bouquet",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color.fromRGBO(190, 54, 165, 1),
                ),)),),
                Padding(padding: EdgeInsets.only(right: 10))
            ],
          ),
        ],
      ),
    );
  }
}
