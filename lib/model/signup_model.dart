class signup_person {
  bool? error;
  String? message;

  signup_person({this.error, this.message});
//open server code
  signup_person.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}
