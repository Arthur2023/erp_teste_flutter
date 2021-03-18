class Client {

  String name;
  String company;
  String phone;
  String email;
  String address;


  Client(this.name, this.company, this.phone, this.email, this.address);

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "company": company,
      "phone" : phone,
      "email" : email,
      "address" : address,
    };
  }

  Client.fromDocument(map) {
    name = map["name"];
    company = map["company"];
    phone = map["phone"];
    email = map["email"];
    address = map["address"];
  }

}