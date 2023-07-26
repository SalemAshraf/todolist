import 'package:cloud_firestore/cloud_firestore.dart';

import 'Model/taskModel.dart';

CollectionReference<TaskModel> getTaskCollection() {
  return FirebaseFirestore.instance.collection('TaskDetails').withConverter<TaskModel>(
        fromFirestore: ((snapshot, options) =>
            TaskModel.fromJson(snapshot.data()!)),
        toFirestore: ((task, options) => task.toJson()),
      );
}

Future<void> addTaskToFireBase(TaskModel task)
{
  var taskCollection = getTaskCollection();
  var docRef = taskCollection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Future<void> deleteTaskFromFireStore(TaskModel task)async{
 return getTaskCollection().doc(task.id).delete();
}