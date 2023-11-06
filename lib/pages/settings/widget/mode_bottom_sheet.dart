import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app_v1/pages/settings/widget/selected_option.dart';
import 'package:todo_app_v1/pages/settings/widget/unselected_option.dart';
import '../../../../app_provider.dart';

class ModeBottomSheet extends StatelessWidget {
  const ModeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    var locale = AppLocalizations.of(context);
    return Container(
      height: 400,
      color: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                appProvider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: appProvider.isDark()
                  ?  SelectedOption(title: locale!.dark)
                  :  UnselectedOption(title: locale!.dark)),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
              onTap: () {
                appProvider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: appProvider.isDark()
                  ?  UnselectedOption(title: locale!.light)
                  :  SelectedOption(title: locale!.light)),
        ],
      ),
    );
  }
}
