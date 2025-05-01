import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flowershop/pages/home_page.dart';
import 'package:flowershop/pages/payment_page.dart';
import 'package:flowershop/pages/temporary_storage.dart';
import 'package:flowershop/pages/token_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({super.key, DateTime? date, TimeOfDay? time});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class ItemsToCheckOut {
  final int quantity;
  final String name;
  final double subprice;

  ItemsToCheckOut({
    required this.quantity,
    required this.name,
    required this.subprice,
  });

  factory ItemsToCheckOut.fromJson(Map<String, dynamic> json) {
    return ItemsToCheckOut(
      quantity: int.tryParse(json['quantity']?.toString() ?? '') ?? 0,
      name: json['product_name']?.toString() ?? '',
      subprice: double.tryParse(json['subprice']?.toString() ?? '0') ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {'product_name': name, 'quantity': quantity};
}

class _ConfirmPageState extends State<ConfirmPage> {
  List<ItemsToCheckOut> items = [];
  String? _paymentOption;
  String? _pickupDate;
  String? _pickupTime;
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    fetchPaymentAndSchedule();
    fetchItems();
    fetchTotalPrice();
  }

  Future<void> fetchItems() async {
    final token = await Token.getToken();
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/order'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        items = jsonData.map((item) => ItemsToCheckOut.fromJson(item)).toList();
      });
    }
  }

  Future<void> fetchTotalPrice() async {
    final token = await Token.getToken();
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/cart/total-price'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      totalPrice = double.tryParse(data['total_price'].toString()) ?? 0;
    } else {
      throw Exception('Failed to fetch price');
    }
  }

  Future<void> fetchPaymentAndSchedule() async {
    String? payment = await TemporaryStorage.getPaymentOption();
    String? date = await TemporaryStorage.getPickupDate();
    String? time = await TemporaryStorage.getPickupTime();
    setState(() {
      _paymentOption = payment;
      _pickupDate = date;
      _pickupTime = time;
    });
  }

  Future<void> updateCartStatus() async {
    final token = await Token.getToken();
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/cart/status'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode({"status": "checked_out"}),
    );
  }

  Future<void> sendOrderDetails() async {
    final token = await Token.getToken();
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/order'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode({
        "payment_method": _paymentOption,
        "total_price": totalPrice,
        "pickup_date": _pickupDate,
        "pickup_time": _pickupTime,
        "items": items.map((e) => e.toJson()).toList(),
      }),
    );
    final data = jsonDecode(response.body);

    if (data["success"] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data['message'], style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (data["success"] == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data['message'], style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirm Order",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            await TemporaryStorage.removeData();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentPage()),
            );
          },
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
                    Radio(
                      activeColor: Color.fromRGBO(250, 34, 144, 1),
                      value: 'payment options',
                      groupValue: '',
                      onChanged: (value) {},
                      toggleable: false,
                      fillColor: WidgetStateColor.resolveWith(
                        (states) => Color.fromRGBO(250, 34, 144, 1),
                      ),
                    ),
                    Text(
                      "Payment\nOptions",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(250, 34, 144, 1),
                      ),
                    ),
                  ],
                ),
                Text(
                  "     ..........................................................     ",
                ),
                Column(
                  children: [
                    Radio(
                      value: 'Confirm',
                      groupValue: 'Confirm',
                      onChanged: (value) {},
                      toggleable: false,
                      autofocus: false,
                      fillColor: WidgetStateColor.resolveWith(
                        (states) => Color.fromRGBO(250, 34, 144, 1),
                      ),
                    ),
                    Text(
                      "Confirm\n",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(250, 34, 144, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Order Detail",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              _paymentOption ?? '....',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Pickup Date:${_pickupDate ?? '....'}',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Pickup Time:${_pickupTime ?? '....'}',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
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
                  Text(
                    "Order Summary",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        var item = items[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('${item.quantity}x'),
                              SizedBox(width: 10),
                              Text(
                                item.name,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '₱${item.subprice.toStringAsFixed(2)}',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
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
            Spacer(),
            Text(
              "Total Price",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '₱${totalPrice.toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            ElevatedButton(
              onPressed: () async {
                await updateCartStatus();
                await sendOrderDetails();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(250, 34, 144, 1),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'Confirm Order',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
