import 'package:flutter_biodata/form_biodata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_biodata/model/biodata.dart';
import 'list_biodata.dart';

class DetailPage extends StatefulWidget {
  final Biodata biodata;
  const DetailPage({Key? key, required this.biodata}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Biodata"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                      child: Image(
                      image: NetworkImage(
                          "https://assets.kompasiana.com/items/album/2021/03/24/blank-profile-picture-973460-1280-605aadc08ede4874e1153a12.png?t=o&v=770"),
                      height: 140,
                      width: 140,
                      alignment: Alignment.center,
                    )),
              Center(
                  child: Text(
                "\n\nNIM",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
              ),
              Center(child: Text(widget.biodata.nim!.toString())),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Nama",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
              ),
              Center(child: Text(widget.biodata.name!)),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Alamat",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
              ),
              Center(child: Text(widget.biodata.alamat!)),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Jenis Kelamin",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 20,
              ),
              Center(child: Text(widget.biodata.jenisKelamin!)),              
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Tanggal Lahir",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
              ),
              Center(child: Text(widget.biodata.date.toString())),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
                return ListBiodataPage();
              }
            ),
            );
        },
        child: Icon(Icons.keyboard_arrow_left)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
