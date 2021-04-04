import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsg_final_social/models/message.dart';
import 'package:gsg_final_social/services/services.dart';



class ChatServices{

  ChatServices._();
  static ChatServices chatServices = ChatServices._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  String chatCollection = 'chats';
  String messageCollection = 'messages';

  Future<String> createChat(List<String> userIds) async {
    DocumentReference documentReference = await 
        fireStore
        .collection(chatCollection)
        .add({'users': userIds});
    return documentReference.id ;
  }

  createMessage(Message message){
    fireStore
    .collection(chatCollection)
    .doc(message.chatId)
    .collection(messageCollection)
    .add(message.toJson());
  }

  Future<QuerySnapshot> getAllCurrentUserChats()async{
    String userId = Services.services.getUserId();
    QuerySnapshot querySnapshot = await fireStore
    .collection(chatCollection)
    .where('users' , arrayContains: userId)
    .get();
    return querySnapshot ;
  }

  getChatMessages(String chatId){
    Stream<QuerySnapshot> stream = fireStore
    .collection(chatCollection)
    .doc(chatId)
    .collection(messageCollection)
    .orderBy('createdAt' , descending: true)
    .snapshots();
    return stream ;
  }

}