// ignore_for_file: prefer_final_fields, sort_child_properties_last

import 'dart:io';
import 'package:flutter_car_installment_calculator/views/result_screen_ui.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class InputScreenUI extends StatefulWidget {
  const InputScreenUI({super.key});

  @override
  State<InputScreenUI> createState() => _InputScreenUIState();
}

class _InputScreenUIState extends State<InputScreenUI> {
//สร้างตัวแปล ควบคุม radio
  int _downCtrl = 10;

  TextEditingController _carPriceCtrl = TextEditingController();
  TextEditingController _InterestCtrl = TextEditingController();

  int _monthCtrl = 24;

  //สร้ง mettod แสดงไดอาล็อคแจ้งเตือน
  _warningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
        ),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

  File? _imageFile;

//สร้าง mettod เปิดกล้อง
  _openCamara() async {
    final pickerImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickerImage == null) return;
    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

//สร้าง mettod แกลลอลี่
  _openGallery() async {
    final pickerImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickerImage == null) return;
    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'คำนวนค่างวดรถ',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Column(
                            children: [
                              ListTile(
                                title: Text('เปิดกล้อง (Open Camara)'),
                                onTap: () {
                                  _openCamara();
                                },
                                leading: Icon(
                                  Icons.camera_alt,
                                  color: Colors.yellowAccent,
                                ),
                              ),
                              ListTile(
                                title: Text('เปิดแกลลอลี่ (Open Gallery)'),
                                onTap: () {
                                  _openGallery();
                                },
                                leading: Icon(
                                  Icons.image,
                                  color: Colors.yellowAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    //เปิด สแนกบารื ให้ผู้ใช้เลือกเปิดกล้อง หรือ แกลลอลี่
                    child: _imageFile == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/img02.png',
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _imageFile!,
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ราคารถ (บาท)',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                TextField(
                  controller: _carPriceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนเงินดาวน์ (%)',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Radio(
                      onChanged: (value) {
                        setState(
                          () {
                            _downCtrl = value!;
                          },
                        );
                      },
                      value: 10,
                      groupValue: _downCtrl,
                    ),
                    Text('10'),
                    Radio(
                      onChanged: (value) {
                        setState(
                          () {
                            _downCtrl = value!;
                          },
                        );
                      },
                      value: 15,
                      groupValue: _downCtrl,
                    ),
                    Text('15'),
                    Radio(
                      onChanged: (value) {
                        setState(
                          () {
                            _downCtrl = value!;
                          },
                        );
                      },
                      value: 20,
                      groupValue: _downCtrl,
                    ),
                    Text('20'),
                    Radio(
                      onChanged: (value) {
                        setState(
                          () {
                            _downCtrl = value!;
                          },
                        );
                      },
                      value: 25,
                      groupValue: _downCtrl,
                    ),
                    Text('25'),
                    Radio(
                      onChanged: (value) {
                        setState(
                          () {
                            _downCtrl = value!;
                          },
                        );
                      },
                      value: 30,
                      groupValue: _downCtrl,
                    ),
                    Text('30'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ระนะเวลาผ่อน (เดือน)',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: DropdownButton<int>(
                      value: _monthCtrl,
                      isExpanded: true,
                      underline: Container(),
                      onChanged: (int? value) {
                        setState(() {
                          _monthCtrl = value!;
                        });
                      },
                      items: <int>[
                        24,
                        36,
                        48,
                        60,
                        72,
                      ].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value เดือน',
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ราคาดอกเบี้ย (%:ปี)',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                TextField(
                  controller: _InterestCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    //ตรวจสอบหน้าจอ ว่าป้อนครบไหม หากไม่ครบ ให้แสดงไดอาล๊อคแจ้งเตือน
                    if (_carPriceCtrl.text.isEmpty) {
                      _warningDialog('ป้อนราคารถด้วย');
                    } else if (_InterestCtrl.text.isEmpty) {
                      _warningDialog('ป้อนราคาดอกเบี้ยด้วยด้วย');
                    } else {
                      //พร้อมคำนวน
                      double carPrice = double.parse(_carPriceCtrl.text);
                      double interest = double.parse(_InterestCtrl.text);

                      //ยอดจัด ราคารภ - เงินดาวน์ๅ
                      double balance = carPrice - (carPrice * _downCtrl / 100);

                      //ดอกเบี้ยที่ต้องจ่ายทั้งหมด ยอดจัด * ดอกเบี้ย / 100 / 12 * จำนวนเงินผ่อน
                      double totalInterest =
                          (balance * interest / 100 / 12) * _monthCtrl;

                      //ยอดผ่อนต่อเดือน ยอดจัด + ดอกเบี้ยทั้งหมด / จำนวนเงินผ่อน
                      double monthlyPayment =
                          (balance + totalInterest) / _monthCtrl;

                      //ส่งผลไปแสดงที่หน้า result แบบย้อนกลับได้
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreenUi(
                              carPrice: carPrice,
                              monthlyPayment: monthlyPayment,
                              month: _monthCtrl,
                            )),
                      );
                    }
                  },
                  child: Text(
                    'คำนวณ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
