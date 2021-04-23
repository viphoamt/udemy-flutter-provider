import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudoey_flutter/models/task.dart';
import 'package:tudoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  String task;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Add task',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              onChanged: (value) {
                task = value;
              },
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              onPressed: () {
                Provider.of<TaskData>(context).addTask(Task(name: task));
                Navigator.pop(context);
              },
              color: Colors.lightBlueAccent,
              child: Center(
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
