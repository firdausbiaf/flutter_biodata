// ignore_for_file: file_names, unnecessary_this, prefer_collection_literals

class Biodata{
  int? id;
  String? name;
  String? nim;
  String? alamat;
  String? jenisKelamin;
  String? date;

  Biodata({this.id, this.name, this.nim, this.alamat, this.jenisKelamin, this.date});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['nim'] = nim;
    map['alamat'] = alamat;
    map['jenisKelamin'] = jenisKelamin;
    map['date'] = date;
    
    return map;
  }

  Biodata.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.nim = map['nim'];
    this.alamat = map['alamat'];
    this.jenisKelamin = map['jenisKelamin'];
    this.date = map['date'];
  }
}