import 'package:cloud_firestore/cloud_firestore.dart';


class Message{

  String senderId ;
  String senderName ;
  String messageContent ;
  String data ;
  String chatId ;
  DateTime createdAt ;

  Message({this.senderId , this.senderName , this.messageContent , this.data , this.chatId , this.createdAt});

  Map <String , dynamic> toJson(){
    return {
      'senderId' : this.senderId ,
      'senderName' : this.senderName ,
      'messageContent' : this.messageContent ,
      'data' : this.data ,
      'chatId' : this.chatId ,
      'createdAt' : this.createdAt ,
    };
  }

  Message.fromJson(Map <String , dynamic> jsonObj){
    this.senderId = jsonObj['senderId'] ;
    this.senderName = jsonObj['senderName'] ;
    this.messageContent = jsonObj['messageContent'] ;
    this.data = jsonObj['data'] ;
    this.chatId = jsonObj['chatId'] ;
    this.createdAt = (jsonObj['createdAt'] as Timestamp).toDate();
  }

}