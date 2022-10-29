
class PersonaModel{
  String name;
  String lastName;
  String email;
  String age;
  // Todo: change to taxonomy
  String gender;
  String documentNumber;
  // Todo: change to taxonomy
  String documentType;
  String user;
  String password;
  String nid;


  PersonaModel(
    this.name,
    this.lastName,
    this.email,
    this.age,
    this.gender,
    this.documentNumber,
    this.documentType,
    this.user,
    this.password,
    this.nid,
  );

  factory PersonaModel.fromJson(Map<String, dynamic> persona) {
    return PersonaModel(
      persona['name'] ?? '', // Null aware
      persona['lastName'] ?? '',
      persona['email'] ?? '',
      persona['age'] ?? '',
      persona['gender'] ?? '',
      persona['documentNumber'] ?? '',
      persona['documentType'] ?? '',
      persona['user'] ?? '',
      persona['password'] ?? '',
      persona['nid'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lastName'] = lastName;
    data['email'] = email;
    data['age'] = age;
    data['gender'] = gender;
    data['documentNumber'] = documentNumber;
    data['documentType'] = documentType;
    data['user'] = user;
    data['password'] = password;
    data['nid'] = nid;
    return data;
  }



  /// Home
  /// {name: 'pedro',....}
  /// PersonaModel.fromJson(persona)
  /// PersonaModel.toJson()


}
