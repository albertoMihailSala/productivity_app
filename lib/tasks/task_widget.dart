import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'task_class.dart';

class TaskWidget extends StatelessWidget {
  //const TaskWidget({Key? key}) : super(key: key);

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
          onPressed: null,
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ],
    ),

    child: buildTask(context),  //CONTEXT

    endActionPane: ActionPane(
      motion: DrawerMotion(),
      children: [
        SlidableAction(
          onPressed: null,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
  );

  @override
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
        Text(
          task.title,
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );

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
          size: 36.0);
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
