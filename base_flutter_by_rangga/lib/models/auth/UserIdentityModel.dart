class UserIdentityModel {
    String status;
    String message;
    Data data;

    UserIdentityModel({
        this.status,
        this.message,
        this.data,
    });

    factory UserIdentityModel.fromJson(Map<String, dynamic> json) => UserIdentityModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    int id;
    dynamic kode;
    String name;
    dynamic namaLengkap;
    String email;
    dynamic foto;
    dynamic provider;
    dynamic providerId;
    String level;
    String asalSekolah;
    String alamat;
    dynamic kota;
    String noHp;
    dynamic moto;
    int saldoTo;
    int paketSebelum;
    int paketTo;
    dynamic paketSoal;
    int status;
    int notifikasi;
    String fb;
    String twitter;
    String ig;
    String line;
    dynamic tempatLahir;
    dynamic tanggalLahir;
    dynamic namaIbu;
    dynamic pekerjaanIbu;
    dynamic namaAyah;
    dynamic pekerjaanAyah;
    dynamic pendidikanTerakhir;
    dynamic ukuranKaos;
    dynamic sisaPembayaran;
    dynamic referensiDari;
    dynamic referensiLain;
    dynamic sudahTo;
    dynamic modulTpaTbi;
    dynamic modulSkd;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        this.id,
        this.kode,
        this.name,
        this.namaLengkap,
        this.email,
        this.foto,
        this.provider,
        this.providerId,
        this.level,
        this.asalSekolah,
        this.alamat,
        this.kota,
        this.noHp,
        this.moto,
        this.saldoTo,
        this.paketSebelum,
        this.paketTo,
        this.paketSoal,
        this.status,
        this.notifikasi,
        this.fb,
        this.twitter,
        this.ig,
        this.line,
        this.tempatLahir,
        this.tanggalLahir,
        this.namaIbu,
        this.pekerjaanIbu,
        this.namaAyah,
        this.pekerjaanAyah,
        this.pendidikanTerakhir,
        this.ukuranKaos,
        this.sisaPembayaran,
        this.referensiDari,
        this.referensiLain,
        this.sudahTo,
        this.modulTpaTbi,
        this.modulSkd,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        kode: json["kode"],
        name: json["name"] == null ? null : json["name"],
        namaLengkap: json["nama_lengkap"],
        email: json["email"] == null ? null : json["email"],
        foto: json["foto"],
        provider: json["provider"],
        providerId: json["provider_id"],
        level: json["level"] == null ? null : json["level"],
        asalSekolah: json["asal_sekolah"] == null ? null : json["asal_sekolah"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        kota: json["kota"],
        noHp: json["no_hp"] == null ? null : json["no_hp"],
        moto: json["moto"],
        saldoTo: json["saldo_to"] == null ? null : json["saldo_to"],
        paketSebelum: json["paket_sebelum"] == null ? null : json["paket_sebelum"],
        paketTo: json["paket_to"] == null ? null : json["paket_to"],
        paketSoal: json["paket_soal"],
        status: json["status"] == null ? null : json["status"],
        notifikasi: json["notifikasi"] == null ? null : json["notifikasi"],
        fb: json["fb"] == null ? null : json["fb"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        ig: json["ig"] == null ? null : json["ig"],
        line: json["line"] == null ? null : json["line"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"],
        namaIbu: json["nama_ibu"],
        pekerjaanIbu: json["pekerjaan_ibu"],
        namaAyah: json["nama_ayah"],
        pekerjaanAyah: json["pekerjaan_ayah"],
        pendidikanTerakhir: json["pendidikan_terakhir"],
        ukuranKaos: json["ukuran_kaos"],
        sisaPembayaran: json["sisa_pembayaran"],
        referensiDari: json["referensi_dari"],
        referensiLain: json["referensi_lain"],
        sudahTo: json["sudah_to"],
        modulTpaTbi: json["modul_tpa_tbi"],
        modulSkd: json["modul_skd"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "kode": kode,
        "name": name == null ? null : name,
        "nama_lengkap": namaLengkap,
        "email": email == null ? null : email,
        "foto": foto,
        "provider": provider,
        "provider_id": providerId,
        "level": level == null ? null : level,
        "asal_sekolah": asalSekolah == null ? null : asalSekolah,
        "alamat": alamat == null ? null : alamat,
        "kota": kota,
        "no_hp": noHp == null ? null : noHp,
        "moto": moto,
        "saldo_to": saldoTo == null ? null : saldoTo,
        "paket_sebelum": paketSebelum == null ? null : paketSebelum,
        "paket_to": paketTo == null ? null : paketTo,
        "paket_soal": paketSoal,
        "status": status == null ? null : status,
        "notifikasi": notifikasi == null ? null : notifikasi,
        "fb": fb == null ? null : fb,
        "twitter": twitter == null ? null : twitter,
        "ig": ig == null ? null : ig,
        "line": line == null ? null : line,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
        "nama_ibu": namaIbu,
        "pekerjaan_ibu": pekerjaanIbu,
        "nama_ayah": namaAyah,
        "pekerjaan_ayah": pekerjaanAyah,
        "pendidikan_terakhir": pendidikanTerakhir,
        "ukuran_kaos": ukuranKaos,
        "sisa_pembayaran": sisaPembayaran,
        "referensi_dari": referensiDari,
        "referensi_lain": referensiLain,
        "sudah_to": sudahTo,
        "modul_tpa_tbi": modulTpaTbi,
        "modul_skd": modulSkd,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}