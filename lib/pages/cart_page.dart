import 'package:flowershop/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flowershop/pages/delivery_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List<Map<String, dynamic>> cartItems = [
    {'name': 'Tulip', 'price': 650, 'quantity': 1, 'image': 'lib/assets/images/tulip.png'},
    {'name': 'Daffodil', 'price': 650, 'quantity': 1, 'extras': 'Extra wrapping', 'image': 'lib/assets/images/daffodil.png'},
    {'name': 'White roses', 'price': 650, 'quantity': 1, 'image': 'lib/assets/images/white-rose.png'},
    {'name': 'Red lily', 'price': 650, 'quantity': 1, 'extras': 'Extra wrapping, Extra Sponge', 'image': 'lib/assets/images/redlily.png'},
    {'name': 'Bouquet No. 1', 'price': 650, 'quantity': 1, 'image': 'lib/assets/images/pinkboq.png'},
  ];
  
  int getTotalPrice() {
    return cartItems.fold<int>(0, (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: GoogleFonts.inter(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                var item = cartItems[index];
                return Column(
                  children: [
                    ListTile(
                      minTileHeight: 120,
                      leading: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
                            child: Image.asset(
                              cartItems[index]['image']!,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['name'], style: TextStyle(fontSize: 18)),
                          Text('${item['price']} php', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      subtitle: item.containsKey('extras') ? Text(item['extras']) : null,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                               if (item['quantity'] > 1) {
                                  item['quantity']--;
                                } else {
                                  cartItems.remove(item); 
                                }
                              });
                            },
                          ),
                          Text('${item['quantity']}', style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                item['quantity']++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Total price", style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400)),
                        Text("₱ ${getTotalPrice()}", style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                      ),
                      onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryPage()))},
                      child: Text("Place an order", style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}
