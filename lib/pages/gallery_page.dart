
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flowershop/pages/cart_page.dart';
import 'package:flowershop/pages/customize_page.dart';
import 'package:flowershop/pages/home_page.dart';
import 'package:flowershop/pages/notif_page.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPagestate();
}

class _GalleryPagestate extends State<GalleryPage> {

  int _selectedIndex = 0; // Set the default selected index

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

  final List<Map<String, String>> bouquets = [
    {'name': 'Boquet No.1', 'image': 'lib/assets/images/rainbowrose.png', 'price': '₱650.00 PHP'},
    {'name': 'Boquet No.2', 'image': 'lib/assets/images/smallvase.png', 'price': '₱650.00 PHP'},
    {'name': 'Boquet No.3', 'image': 'lib/assets/images/tulipboq.png', 'price': '₱650.00 PHP'},
    {'name': 'Boquet No.4', 'image': 'lib/assets/images/pinkboq.png', 'price': '₱650.00 PHP'},
    {'name': 'Boquet No.5', 'image': 'lib/assets/images/smallboq.png', 'price': '₱650.00 PHP'},
    {'name': 'Boquet No.6', 'image': 'lib/assets/images/yellowboq.png', 'price': '₱650.00 PHP'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'What do you want to find?',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.grey[200],
            filled: true,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gallery',
                  style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        side: BorderSide(width: 1,color: Colors.grey),
                        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                        )
                      ),
                      child: Text("sort by",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),)),),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        side: BorderSide(width: 1,color: Colors.grey),
                        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                        )
                      ),
                      child: Text("filter",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),)),),
                      Padding(padding: EdgeInsets.only(right: 10))
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: bouquets.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.asset(
                              bouquets[index]['image']!,
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(bouquets[index]['name']!, style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              Text(bouquets[index]['price']!, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color.fromRGBO(190, 54, 165, 1), width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                                minimumSize: Size(30, 5),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
