import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:tudoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [
    Task(name: 'Lear Flutter'),
    Task(name: 'Lear React Native'),
    Task(name: 'Lear IOS'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(Task newTask){
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleCheckBox(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }
}