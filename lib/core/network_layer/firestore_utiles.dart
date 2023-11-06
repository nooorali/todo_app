import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app_v1/model/task_model.dart';

class FirestoreUtiles {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance.collection("taskCollection")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) =>
          TaskModel.fromFirestore(snapshot.data()!),
      toFirestore: (value, _) => value.toFirestore(),);
  }

  static Future<void> addDataToFirestore(TaskModel model) {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc();
    model.id = docRef.id;
    return docRef.set(model);

  }

  static Future<void> deleteDataToFirestore(TaskModel model) {
    var collectionRef = getCollection();
    return collectionRef.doc(model.id).delete();

  }

  static Future<List<TaskModel>> getDataFromFirestore() async {
    var snapshot = await getCollection().get();
     return snapshot.docs.map((element) => element.data()).toList();
  }

  static Stream<QuerySnapshot<TaskModel>> getRealTimeDataFromFirestore()  {

    var snapshot = getCollection().where("userId",isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots();
    return snapshot;
  }

  static Future<void> isDone (TaskModel model) async {
    getCollection().doc(model.id).update(
      {
        "isDone" : !model.isDone,
      }
    );
  }

  static Future<void> updateTask (TaskModel model) async {
    getCollection().doc(model.id).update(model.toFirestore());
  }


}
