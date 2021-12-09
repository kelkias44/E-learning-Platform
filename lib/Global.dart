import 'dart:convert';

class myGlobal {
  String firstname = '';
  String lastname = '';
  String photo = '';
  String password = '';
  String email = '';
  String userid = '';


  static final myGlobal _instance = myGlobal._internal();
 factory myGlobal()=> _instance;
  myGlobal._internal(){
    firstname = '';
    lastname = '';
    photo = '';
    password = '';
    email = '';
    userid = '';
  }

  void setemail(String email){
    this.email = email;
  }
  void setId(String userid){
    this.userid = userid;
  }
  void setFirstName(String firstname){
    this.firstname = firstname;
  }
  void setLastName(String lastname){
    this.lastname = lastname;
  }
  void setPhoto(String photo){
    this.photo = photo;
  }
  void setPassword(String password){
    this.password = password;
  }


  String getemail(){
    return email;
  }
  String getId(){
    return userid;
  }
  String getFirstName(){
    return  firstname;
  }
  String getLastName(){
    return lastname;
  }
  String  getPhoto(){
    return photo;
  }

  String getPassword(){
    return password;
  }
}