import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hemtak_app/services/hemtak.dart';
import 'package:hemtak_app/services/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference hemtakCollection =
  FirebaseFirestore.instance.collection('hemtak');

  Future<void> updateUserData(String fullName, String id, String address, int phone) async {
    return await hemtakCollection.doc(uid).set({
      'الاسم الكامل': fullName,
      'الرقم الوطني': id,
      'مكان الإقامة': address,
      'رقم الجوال': phone,
    });
  }

  // brew list from snapshot
  List<Hemtak> _hemtakListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return Hemtak(
          fullName: doc.data()['الاسم'] ?? "",
          id: doc.data()['الرقم الوطني'] ?? "",
          address: doc.data()['العنوان'] ?? '',
          phone: doc.data()['رقم الجوال'] ?? 0,
      );
    }).toList();
}

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        fullName: snapshot.data()['الاسم'],
        id: snapshot.data()['الرقم الوطني'],
        address: snapshot.data()['العنوان'],
        phone: snapshot.data()['رقم الجوال']
    );
  }

  // get brews stream
  Stream<List<Hemtak>> get hemtak {
    return hemtakCollection.snapshots()
        .map(_hemtakListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return hemtakCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}