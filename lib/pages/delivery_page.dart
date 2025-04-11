import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flowershop/pages/confirm_page.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {

  String _selectedPayment = 'Pay In-Person';
  String _selectedSchedule = 'As Soon as Possible';
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Delivery Options", style: GoogleFonts.inter(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
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
                    Radio(activeColor: Color.fromRGBO(250, 34, 144, 1), value: 'delivery options', groupValue: 'delivery options', onChanged: (value){}, toggleable: false,),
                    Text("Delivery\nOptions", style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(250, 34, 144, 1),),),
                  ],
                ),
                Text("     ..........................................................     "),
                Column(
                  children: [
                    Radio(value: 'Confirm', groupValue: '', onChanged: (value){}, toggleable: false, autofocus: false,
                    fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(250, 34, 144, 1))),
                    Text("Confirm\n",  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(250, 34, 144, 1),),),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text('Set Payment', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
            ListTile(
              title: Text('Pay In-Person', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
              leading: Radio(
                activeColor: Color.fromRGBO(250, 34, 144, 1),
                fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(250, 34, 144, 1)),
                value: 'Pay In-Person',
                groupValue: _selectedPayment,
                onChanged: (value) {
                  setState(() {
                    _selectedPayment = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('GCash', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
              leading: Radio(
                activeColor: Color.fromRGBO(250, 34, 144, 1),
                fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(250, 34, 144, 1)),
                value: 'GCash',
                groupValue: _selectedPayment,
                onChanged: (value) {
                  setState(() {
                    _selectedPayment = value.toString();
                  });
                },
              ),
            ),
            Divider(),
            Padding(padding: EdgeInsets.only(top: 15)),
            Text('Set Schedule', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
            ListTile(
              title: Text('As Soon as Possible', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
              leading: Radio(
                activeColor: Color.fromRGBO(250, 34, 144, 1),
                fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(250, 34, 144, 1)),
                value: 'As Soon as Possible',
                groupValue: _selectedSchedule,
                onChanged: (value) {
                  setState(() {
                    _selectedSchedule = value.toString();
                  });
                },
              ),
              subtitle: Text('Now - 10 Minutes', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w300),),
            ),
            ListTile(
              title: Text('Later', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
              leading: Radio(
                activeColor: Color.fromRGBO(250, 34, 144, 1),
                fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(250, 34, 144, 1)),
                value: 'Later',
                groupValue: _selectedSchedule,
                onChanged: (value) {
                  setState(() {
                    _selectedSchedule = value.toString();
                  });
                },
              ),
              subtitle: Text('Schedule Pick Up', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w300),),
            ),
            if (_selectedSchedule == 'Later') ...[
              Divider(),
              Padding(padding: EdgeInsets.only(top: 15)),
              ListTile(
                title: Text(_selectedDate == null
                    ? 'Select Date'
                    : DateFormat('MM/dd/yyyy').format(_selectedDate!)),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              ListTile(
                title: Text(_selectedTime == null
                    ? 'Select Time'
                    : _selectedTime!.format(context)),
                trailing: Icon(Icons.access_time),
                onTap: () => _selectTime(context),
              ),
            ],
            Spacer(),
            ElevatedButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage()))},
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
