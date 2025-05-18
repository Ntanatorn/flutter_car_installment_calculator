import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreenUi extends StatefulWidget {
  double? carPrice;
  double? monthlyPayment;
  int? month;

  ResultScreenUi({super.key, this.carPrice, this.monthlyPayment, this.month});

  @override
  State<ResultScreenUi> createState() => _ResultScreenUiState();
}

class _ResultScreenUiState extends State<ResultScreenUi> {
  @override
  Widget build(BuildContext context) {
    //  กำหนดรูปแบบการแสดงผล ญ ที่นี้้ คอมม่าขั้น หลักพัน ล้าน และต้องมีแค่ทศนิยม2ตำแหน่ง
    NumberFormat fm = NumberFormat("#,###,##0.00");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'CI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ผ่อนทั้งหมด ${widget.month} เดือน',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'ค่างวดรถต่อเดือน',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${fm.format(widget.monthlyPayment)}',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            Text(
              'บาท',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
