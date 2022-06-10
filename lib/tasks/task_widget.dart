import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'task_class.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/task_provider.dart';
import 'task_utils.dart';
import 'edit_task_page.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
    key: Key(task.id),
    startActionPane: ActionPane(
      motion: DrawerMotion(),
      children: [
        SlidableAction(
          onPressed: (context) => editTask(context, task),
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
          //icon: Icons.refresh,
          label: 'Update',
        ),
      ],
    ),

    child: buildTask(context),  //CONTEXT

    endActionPane: ActionPane(
      motion: DrawerMotion(),
      children: [
        SlidableAction(
          onPressed: (context) => deleteTask(context, task),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          //icon: Icons.close,
          label: 'Remove',
        ),
      ],
    ),
  );

  Widget buildTask(BuildContext context) => Container(
    decoration: BoxDecoration(
      border: Border(
        top: const BorderSide(
              color: Colors.transparent),
        left: const BorderSide(
            color: Colors.transparent),
        right: BorderSide(
            color: getColor(task),
            width: 5),
        bottom: BorderSide(
            color: getColor(task),
            width: 2),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getIcon(task),
        SizedBox(width: 10),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
        ),
      ],
    ),
  );

  void editTask(BuildContext context, Task task) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditTaskPage(task: task),
    ),

  );

  void deleteTask(BuildContext context, Task task){
    final provider = Provider.of<TaskProvider>(context, listen: false);
    provider.removeTask(task);

    //DISPLAY MESSAGE
    TaskUtils.showSnackBar(context, 'Task removed');
  }

  Color getColor(Task task) {
    switch (task.priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.yellow;
      case 'Low':
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  Icon getIcon(Task task) {
    switch (task.category) {
      case 'Personal':
        return const Icon(
          Icons.boy, //attribution / badge
          color: Colors.black,
          size: 45);
      case 'Work':
        return const Icon(
          Icons.business_center_rounded, //attach_money
          color: Colors.black,
          size: 35);
      case 'Other':
        return const Icon(
          Icons.contact_support_outlined ,
          color: Colors.black,
          size: 36.0);
      default:
        return const Icon(
          Icons.close,
          color: Colors.black,
          size: 36.0);
    }
  }
}
