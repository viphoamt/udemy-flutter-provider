import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudoey_flutter/components/task_list.dart';
import 'package:tudoey_flutter/models/task_data.dart';

import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              // addTaskCallBack: (newTask) {
              //   tasks.add(Task(name: newTask));
              //   setState(() {});
              // },
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0, right: 30.0, left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Task',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          TaskList()
        ],
      ),
    );
  }
}
