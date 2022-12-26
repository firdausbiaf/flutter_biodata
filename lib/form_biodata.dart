// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database/db_helper.dart';
import 'model/biodata.dart';


class FormBiodata extends StatefulWidget {
  final Biodata? biodata;

  FormBiodata({this.biodata});

  @override
  _FormBiodataState createState() => _FormBiodataState();
}

class _FormBiodataState extends State<FormBiodata> {
  DbHelper db = DbHelper();

  TextEditingController? name;
  TextEditingController? lastName;
  TextEditingController? nim;
  TextEditingController? alamat;
  TextEditingController? jenisKelamin;
  TextEditingController? date;

  @override
  void initState() {
    name = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.name);

    nim = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.nim);

    alamat = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.alamat);

    jenisKelamin = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.jenisKelamin);
    date = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.date);
        
    super.initState();
  }


  // Variable/State untuk mengambil tanggal
  DateTime selectedDate = DateTime.now();

  //  Initial SelectDate FLutter
  Future<void> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1999, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      print(formattedDate);
      setState(() {
        selectedDate = picked;
        date?.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Biodata'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: nim,
              decoration: InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: alamat,
              decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: jenisKelamin,
              decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          SizedBox(
                height: 20,
              ),
              Text("Tanggal Lahir"),
              TextField(
                controller: date,
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Masukkan Tanggal",
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
              SizedBox(
                height: 30,
              ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20
            ),
            child: ElevatedButton(
              child: (widget.biodata == null)
                  ? Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: () {
                upsertBiodata();
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> upsertBiodata() async {
    if (widget.biodata != null) {
      //update
      await db.updateBiodata(Biodata(
        id: widget.biodata!.id, 
        name: name!.text, 
        nim: nim!.text, 
        alamat: alamat!.text, 
        jenisKelamin: jenisKelamin!.text,
        date: date!.text
      ));

      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveBiodata(Biodata(
        name: name!.text,
        nim: nim!.text,
        alamat: alamat!.text,
        jenisKelamin: jenisKelamin!.text,
        date: date!.text
      ));
      Navigator.pop(context, 'save');
    }
  }
}