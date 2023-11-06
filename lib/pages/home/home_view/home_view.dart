import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v1/core/network_layer/firestore_utiles.dart';
import 'package:todo_app_v1/model/task_model.dart';
import 'package:todo_app_v1/pages/home/home_view/widget/task_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app_v1/pages/login/login_view.dart';

import '../../../app_provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var locale = AppLocalizations.of(context)!;
    var appProvider = Provider.of<AppProvider>(context,listen: false);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: const Alignment(0, 3),
            children: [
              Container(
                width: mediaQuery.width,
                height: 160,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                //alignment: Alignment.centerLeft,
                color: theme.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      locale.list,
                      style: theme.textTheme.titleLarge,
                    ),
                    TextButton(
                        onPressed: () {
                          logOut();
                          Navigator.pushReplacementNamed(context, LoginView.routeName);
                        },
                        child: Text(
                          "Log out",
                          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ))
                  ],
                ),
              ),
              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                onDateSelected: (date) => print(date),
                leftMargin: 20,
                monthColor: Colors.black,
                dayColor: theme.primaryColor,
                activeDayColor: theme.primaryColor,
                activeBackgroundDayColor: Colors.white,
                dotsColor: Colors.transparent,
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
              stream: FirestoreUtiles.getRealTimeDataFromFirestore(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text(snapshot.error.toString()),
                      const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            // call api again
                          },
                          icon: const Icon(Icons.refresh))
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: theme.primaryColor,
                    ),
                  );
                }
                var tasksList =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                if(tasksList.isEmpty) {
                  return Center(
                    child: Text("There are no tasks",style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.primaryColor,
                    ),),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => TaskItem(
                    model: tasksList[index],
                  ),
                  itemCount: tasksList.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
