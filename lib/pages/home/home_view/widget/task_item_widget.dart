import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v1/core/network_layer/firestore_utiles.dart';
import 'package:todo_app_v1/model/task_model.dart';
import 'package:todo_app_v1/pages/home/home_view/widget/edit_task.dart';

import '../../../../app_provider.dart';

class TaskItem extends StatefulWidget {
  final TaskModel model;

  const TaskItem({super.key, required this.model});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: theme.colorScheme.onBackground,
          borderRadius: BorderRadius.circular(25)),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.5,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) async {
                var appProvider = Provider.of<AppProvider>(context,listen: false);
                await FirestoreUtiles.deleteDataToFirestore(widget.model);
              },
              backgroundColor: const Color(0xFFEC4B4B),
              foregroundColor: Colors.white,
              borderRadius: appProvider.currentLocale == "en"
                  ? const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25))
                  : const BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(context, EditTask.routeName, arguments: widget.model );
              },
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.white,
              borderRadius: appProvider.currentLocale == "ar"
                  ? const BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25))
                  : const BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          width: mediaQuery.width,
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: theme.colorScheme.onBackground,
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 7,
                height: 83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: widget.model.isDone ?  const Color(0xFF61E757) :theme.primaryColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      widget.model.title,
                      overflow: TextOverflow.ellipsis,
                      style: widget.model.isDone ? theme.textTheme.bodyLarge
                          ?.copyWith(color: const Color(0xFF61E757)) : theme.textTheme.bodyLarge
                          ?.copyWith(color: theme.primaryColor),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.model.description,
                      maxLines: 2,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: theme.colorScheme.onSecondary),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          size: 20,
                          color: theme.colorScheme.onSecondary,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          DateFormat.yMMMd().format(widget.model.time),
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.colorScheme.onSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  FirestoreUtiles.isDone(widget.model);
                  setState(() {

                  });
                },
                child: widget.model.isDone ? const Text("Done!",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color:  Color(0xFF61E757),
                ),) : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const ImageIcon(
                    AssetImage("assets/images/icon_check.png"),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
