class UserRegisterModel {
    String status;
    String message;
    Data data;

    UserRegisterModel({
        this.status,
        this.message,
        this.data,
    });

    factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
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
    String token;

    Data({
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null ? null : json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
    };
}