import 'dart:convert';

List<MotivasiModel> motivasiModelFromJson(String str) =>
    List<MotivasiModel>.from(
        json.decode(str).map((x) => MotivasiModel.fromJson(x)));

String motivasiModelToJson(List<MotivasiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MotivasiModel {
  String id;
  String isiMotivasi;
  String idKategori;
  DateTime tanggalInput;
  String tanggalUpdate;

  MotivasiModel({
    this.id = "",
    this.isiMotivasi = "",
    this.idKategori = "",
    DateTime? tanggalInput,
    this.tanggalUpdate = "",
  }) : this.tanggalInput = tanggalInput ?? DateTime.now();

  factory MotivasiModel.fromJson(Map<String, dynamic> json) => MotivasiModel(
        id: json["id"],
        isiMotivasi: json["isi_motivasi"],
        idKategori: json["id_kategori"],
        tanggalInput: DateTime.parse(json["tanggal_input"]),
        tanggalUpdate: json["tanggal_update"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isi_motivasi": isiMotivasi,
        "id_kategori": idKategori,
        "tanggal_input": "${tanggalInput.year.toString().padLeft(4, '0')}-" +
            "${tanggalInput.month.toString().padLeft(2, '0')}-" +
            "${tanggalInput.day.toString().padLeft(2, '0')}",
        "tanggal_update": tanggalUpdate,
      };
}
