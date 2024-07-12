import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegisterModel {
  final String userName;
  final String firstname;
  final String lastname;
  final String userPassword;
  final String userEmail;
  final String userType;
  final String firstLogon;
  final String lastLogon;
  final String createDate;
  final String userActive;
  final String active;
  final String defaulter;

  RegisterModel(
      this.userName,
      this.firstname,
      this.lastname,
      this.userPassword,
      this.userEmail,
      this.userType,
      this.firstLogon,
      this.lastLogon,
      this.createDate,
      this.userActive,
      this.active,
      this.defaulter);

  RegisterModel.fromJson(Map<String, dynamic> json)
      : userName = json['UserName'] as String,
        firstname = json['Firstname'] as String,
        lastname = json['Lastname'] as String,
        userPassword = json['UserPassword'] as String,
        userEmail = json['UserEmail'] as String,
        userType = json['UserType'] as String,
        firstLogon = json['firstLogon'] as String,
        lastLogon = json['lastLogon'] as String,
        createDate = json['createDate'] as String,
        userActive = json['UserActive'] as String,
        active = json['Active'] as String,
        defaulter = json['defaulter'] as String;

  Map<String, dynamic> toJson() => {
        'UserName': userName,
        'Firstname': firstname,
        'Lastname': lastname,
        'UserPassword': userPassword,
        'UserEmail': userEmail,
        'UserType': userType,
        'firstLogon': firstLogon,
        'lastLogon': lastLogon,
        'createDate': createDate,
        'UserActive': userActive,
        'Active': active,
        'defaulter': defaulter,
      };
}
