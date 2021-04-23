import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudoey_flutter/models/task.dart';
import 'package:tudoey_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Consumer<TaskData>(
            builder: (BuildContext context, value, Widget child) {
              return ListView.builder(
                itemCount: value.taskCount,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value.tasks[index].name,
                        style: TextStyle(
                            decoration: Provider.of<TaskData>(context).tasks[index].isDone
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      Checkbox(
                        value: value.tasks[index].isDone,
                        onChanged: (bool newChange) {
                            value.toggleCheckBox(value.tasks[index]);
                            value.deleteTask(index);
                        },
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
