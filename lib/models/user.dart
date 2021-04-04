


class UserData{

  String userId ;
  String userName ;
  String userPhone ;
  String userEmail ;
  String userPassword ;
  String userAddress ;

  UserData({ this.userId , this.userName , this.userPhone , this.userEmail , this.userPassword ,  this.userAddress}) ;

  Map <String , dynamic> toJson(){
    return {
      'userId' : this.userId ,
      'userName' : this.userName ,
      'userPhone' : this.userPhone ,
      'userEmail' : this.userEmail ,
      'userPassword' : this.userPassword ,
      'userAddress' : this.userAddress ,
    };
  }

  UserData.fromJson(Map <String , dynamic> jsonObj){
    this.userId = jsonObj['userId'] ;
    this.userName = jsonObj['userName'] ;
    this.userPhone = jsonObj['userPhone'] ;
    this.userEmail = jsonObj['userEmail'] ;
    this.userPassword = jsonObj['userPassword'] ;
    this.userAddress = jsonObj['userAddress'];
  }

}