import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flowershop/pages/delivery_page.dart';


class ConfirmPage extends StatefulWidget {
  const ConfirmPage({super.key, DateTime? date, TimeOfDay? time});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}


 Widget _orderItem(String name, int quantity, int price, {String? extra}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${quantity}x  $name", style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500)),
              Text("₱ ${price.toStringAsFixed(2)}", style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),
          if (extra != null)
            Text(extra, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _priceItem(String label, int price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500)),
          Text("₱ ${price.toStringAsFixed(2)}", style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }




class _ConfirmPageState extends State<ConfirmPage> {
   final List<Map<String, dynamic>> orders = [
    {"name": "Tulip", "quantity": 1, "price": 650},
    {"name": "Daffodil", "quantity": 1, "price": 650, "extra": "Extra Wrapping"},
    {"name": "White roses", "quantity": 1, "price": 650},
    {"name": "Red lily", "quantity": 1, "price": 650, "extra": "Extra wrapping, Extra sponge"},
  ];

  int get totalPrice {
    int subtotal = orders.fold(0, (sum, order) => sum + (order["quantity"] * order["price"]) as int);
    int adminFee = 10;
    return subtotal + adminFee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order", style: GoogleFonts.inter(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Radio(activeColor: Color.fromRGBO(250, 34, 144, 1), value: 'delivery options', groupValue: '', onChanged: (value){}, toggleable: false,
                    fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(250, 34, 144, 1))),
                    Text("Delivery\nOptions", style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(250, 34, 144, 1),),),
                  ],
                ),
                Text("     ..........................................................     "),
                Column(
                  children: [
                    Radio(value: 'Confirm', groupValue: 'Confirm', onChanged: (value){}, toggleable: false, autofocus: false,
                    fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(250, 34, 144, 1))),
                    Text("Confirm\n",  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(250, 34, 144, 1),),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Order Detail",
              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              "Pay-In Person\nRizza’s Flower Shop\nMWCW+588, Rizal St, Bacolod, 6100 Negros Occidental\nPick up time: 02/10/25 - 09:00 - 21:00",
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Summary", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
                  Divider(),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        var order = orders[index];
                        return _orderItem(order["name"], order["quantity"], order["price"], extra: order["extra"]);
                      },
                    ),
                  ),
                  Divider(),
                  _priceItem("Subtotal", totalPrice - 10),
                  _priceItem("Admin fee", 10),
                ],
              ),
            ),
            Spacer(),
            Text(
              "Total Price",
              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              "₱ ${totalPrice.toStringAsFixed(2)}",
              style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color.fromRGBO(250, 34, 144, 1),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
              ),
              child: Text('Confirm Order', style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
