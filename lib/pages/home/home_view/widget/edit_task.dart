import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v1/core/network_layer/firestore_utiles.dart';
import 'package:todo_app_v1/model/task_model.dart';

import '../../../../app_provider.dart';

class EditTask extends StatefulWidget {
  static const String routeName = "edit_screen";

  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    var appProvider = Provider.of<AppProvider>(context,listen: false);
    var args = ModalRoute.of(context)!.settings.arguments as TaskModel;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: mediaQuery.width,
              height: 160,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              color: theme.primaryColor,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      locale!.list,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: mediaQuery.width,
              height: 600,
              margin: const EdgeInsets.only(
                  right: 30, left: 30, top: 120, bottom: 120),
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 40, bottom: 70),
              decoration: BoxDecoration(
                color: theme.colorScheme.onBackground,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    locale.upTask,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.onSecondary),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: locale.title_field,
                      hintStyle: theme.textTheme.bodyMedium
                          ?.copyWith(color:theme.colorScheme.onSecondary),
                      labelStyle: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.colorScheme.onSecondary),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: theme.primaryColor,
                      )),
                    ),
                    style: TextStyle(
                      color: theme.colorScheme.onSecondary
                    ),
                    initialValue: args.title,
                    onChanged: (value) {
                      args.title = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: locale.description_field,
                        hintStyle: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.colorScheme.onSecondary),
                        labelStyle: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.colorScheme.onSecondary),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: theme.primaryColor,
                        ))),
                    style: TextStyle(
                        color: theme.colorScheme.onSecondary
                    ),
                    initialValue: args.description,
                    onChanged: (value) {
                      args.description = value;
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locale.time,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showCalender(context);
                        },
                        child: Center(
                          child: Text(
                            DateFormat.yMMMd().format(args.time),
                            style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSecondary),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FilledButton(
                        onPressed: () {
                          FirestoreUtiles.updateTask(args);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(theme.primaryColor),
                        ),
                        child: Text(
                          locale.save,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCalender(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
  }
}
