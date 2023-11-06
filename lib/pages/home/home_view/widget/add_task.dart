import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v1/core/network_layer/firestore_utiles.dart';
import 'package:todo_app_v1/model/task_model.dart';
import 'package:todo_app_v1/pages/home/home_view/widget/custom_textfield.dart';

import '../../../../app_provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);


    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 420,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  locale!.new_task,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.onSecondary),
                ),
              ),
              CustomTextField(
                textEditingController: titleController,
                title: locale.title_field,
                maxLines: 1,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "You must provide task title";
                  } else if (value.length < 10) {
                    return "title must be at least 10 characters";
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextField(
                  textEditingController: descriptionController,
                  title: locale.description_field,
                  maxLines: 4,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "You must provide task title";
                    } else if (value.length < 10) {
                      return "title must be at least 10 characters";
                    } else {
                      return null;
                    }
                  }),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locale.time,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.onSecondary),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCalender(context);
                    },
                    child: Center(
                      child: Text(
                        DateFormat.yMMMd().format(selectedDate),
                        style: theme.textTheme.bodySmall
                            ?.copyWith(
                              color: theme.primaryColor,
                            )
                            .copyWith(color: theme.colorScheme.onSecondary),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var model = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          time: selectedDate,
                          isDone: false,

                      );

                      await FirestoreUtiles.addDataToFirestore(model);

                    }
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(theme.primaryColor),
                  ),
                  child: Text(
                    locale.add,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void showCalender(BuildContext context) async {
    var dateSelected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (dateSelected == null) return;
    selectedDate = dateSelected;
    setState(() {});
  }
}
