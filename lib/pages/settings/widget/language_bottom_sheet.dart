import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v1/pages/settings/widget/selected_option.dart';
import 'package:todo_app_v1/pages/settings/widget/unselected_option.dart';


import '../../../../app_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      height: 400,
      color: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                appProvider.changeLanguage("en");
                Navigator.of(context).pop();
              },
              child: appProvider.currentLocale == "en"
                  ? const SelectedOption(title: "English")
                  : const UnselectedOption(title: "English")),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
              onTap: () {
                appProvider.changeLanguage("ar");
                Navigator.of(context).pop();
              },
              child: appProvider.currentLocale == "en"
                  ? const UnselectedOption(title: "عربي")
                  : const SelectedOption(title: "عربي")),

        ],
      ),
    );
  }
}
