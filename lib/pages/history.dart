import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState(); 
}

class _HistoryState extends State<History> { 
  final List<String> tabs = ['Pending', 'Ready to Pick Up', 'Picked Up'];

  final List<Map<String, dynamic>> pendingOrders = [
    {
      'id': '#12345',
      'shopName': "Rizza's Flower Shop", 
      'status': 'Processing',
      'pickupTime': '02/10/25 - 10:00-12:00',
      'address': "MWCW+588, Rizal St, Bacolod, 6100 Negros Occidental", 
      'items': [
        {'name': 'Red Roses', 'quantity': 12, 'price': 1200.00, 'extras': []},
        {'name': 'Vase', 'quantity': 1, 'price': 250.00, 'extras': []},
      ],
      'totalPrice': 1450.00,
      'paymentMethod': 'Pay-In Person',
    },
    {
      'id': '#12346',
      'shopName': "Rizza's Flower Shop", 
      'status': 'Waiting for confirmation',
      'pickupTime': '03/10/25 - 14:00-16:00',
      'address': "MWCW+588, Rizal St, Bacolod, 6100 Negros Occidental", 
      'items': [
        {'name': 'Sunflowers', 'quantity': 5, 'price': 750.00, 'extras': []},
      ],
      'totalPrice': 750.00,
      'paymentMethod': 'Pay-In Person',
    },
  ];

  final List<Map<String, dynamic>> readyOrders = [
    
    {
      'id': '#12344',
      'shopName': "Rizza's Flower Shop", 
      'status': 'Ready for pickup',
      'pickupTime': '02/10/25 - 09:00-21:00', 
      'address': "MWCW+588, Rizal St, Bacolod, 6100 Negros Occidental", 
      'items': [
         {'name': 'Tulip', 'quantity': 7, 'price': 650.00, 'extras': ['edit']},
         {'name': 'Daffodil', 'quantity': 10, 'price': 650.00, 'extras': ['Extra Wrapping', 'edit']},
         {'name': 'White roses', 'quantity': 1, 'price': 650.00, 'extras': ['edit']},
         {'name': 'Red lily', 'quantity': 4, 'price': 650.00, 'extras': ['Extra wrapping', 'Extra sponge', 'edit']},
         {'name': 'Another Flower', 'quantity': 2, 'price': 300.00, 'extras': []},
         {'name': 'Yet Another Item', 'quantity': 1, 'price': 150.00, 'extras': ['Special Request']},
      ],
      'totalPrice': 2670.00, 
      'paymentMethod': 'Pay-In Person', 
    },
  ];

  final List<Map<String, dynamic>> pickedUpOrders = [
    {
      'id': '#12343',
      'shopName': "Rizza's Flower Shop",
      'status': 'Picked up',
      'pickupTime': '30/09/25 - 11:00-13:00',
      'address': "MWCW+588, Rizal St, Bacolod, 6100 Negros Occidental", 
      'items': [
        {'name': 'Orchids', 'quantity': 3, 'price': 900.00, 'extras': []},
        {'name': 'Fertilizer', 'quantity': 1, 'price': 150.00, 'extras': []},
      ],
      'totalPrice': 1050.00,
      'paymentMethod': 'Pay-In Person',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1, 
          shadowColor: Colors.grey.shade300, 
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Purchase History',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: TabBar(
            isScrollable: false,
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.grey[700],
            indicatorColor: Colors.pink,
            indicatorWeight: 3.0, // Slightly thicker indicator
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12), 
            unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12), 
            tabs: tabs.map((t) => Tab(text: t)).toList(),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 254, 207, 223), 
        body: TabBarView(
          children: [
            // Pending tab
            _buildOrderList(pendingOrders, Colors.white),

            // Ready to Pick Up tab
            _buildOrderList(readyOrders, Colors.white),

            // Picked Up tab
            _buildOrderList(pickedUpOrders, Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(List<Map<String, dynamic>> orders, Color cardColor) {
    if (orders.isEmpty) {
      return Center(
          child: Text(
        'No orders Availavblet.',
        style: GoogleFonts.poppins(color: Colors.grey[600]),
      ));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final List<dynamic> items = order['items'] as List<dynamic>; // Cast items list

        return Card(
          color: cardColor,
          elevation: 2, 
          shadowColor: Colors.grey.shade200,
          margin: const EdgeInsets.only(bottom: 16), 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), 
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Section: Payment, Shop, Address, Pickup Time
                Text(
                  order['paymentMethod'],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey[700])
                ),
                const SizedBox(height: 4),
                Text(
                  order['shopName'],
                  style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.bold)
                ),
                 const SizedBox(height: 4),
                Text(
                  order['address'],
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600])
                ),
                const SizedBox(height: 8),
                Row( // Use row for label and value
                  children: [
                     Text('Pick up time: ', style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[800])),
                     Text(order['pickupTime'], style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),

                const Divider(height: 24, thickness: 1), // Thicker divider

                // --- Order Summary Section ---
                Text(
                  'Order summary',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)
                ),
                const SizedBox(height: 12),

                // --- Scrollable Item List ---
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.25, 
                  ),
                  child: ListView.builder(
                    shrinkWrap: true, // Important for ListView inside Column/ConstrainedBox
                    itemCount: items.length,
                    itemBuilder: (ctx, itemIndex) {
                      final item = items[itemIndex] as Map<String, dynamic>; // Cast item
                      final List<dynamic> extras = item['extras'] as List<dynamic>? ?? []; // Get extras safely

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0), 
                        child: Column( // Use column to stack main row and extras
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left side: Quantity and Name
                                Flexible( // Allow text wrapping
                                  child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${item['quantity']}x ',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.pink, 
                                            fontSize: 14
                                            ),
                                        ),
                                        Expanded( // Allow name to take space and wrap
                                          child: Text(
                                            item['name'],
                                            style: GoogleFonts.poppins(fontSize: 14),
                                          ),
                                        ),
                                      ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // Right side: Price
                                Text(
                                  '₱${(item['price'] as double).toStringAsFixed(2)} PHP', // Ensure price is double
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                              ],
                            ),
                            // Display Extras below the item row
                            if (extras.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0, top: 2.0), // Indent extras slightly
                                child: Text(
                                  extras.join(', '), // Join extras with a comma
                                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // --- End Scrollable Item List ---

                const Divider(height: 24, thickness: 1),

                // Total Price Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Price', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(
                      '₱${(order['totalPrice'] as double).toStringAsFixed(2)} PHP', // Ensure total price is double
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}