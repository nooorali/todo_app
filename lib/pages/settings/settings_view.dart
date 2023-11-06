import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app_v1/pages/settings/widget/language_bottom_sheet.dart';
import 'package:todo_app_v1/pages/settings/widget/mode_bottom_sheet.dart';
import 'package:todo_app_v1/pages/settings/widget/settings_widget.dart';
import '../../../app_provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);
    var locale = AppLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: mediaQuery.width,
          height: 160,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          color: theme.primaryColor,
          child: Row(
            children: [
              Text(
                locale!.settings,
                style: theme.textTheme.titleLarge,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),

        SettingsWidget(
          title: locale.language,
          selectedOption:
              appProvider.currentLocale == "en" ? "English" : "عربي",
          onClicked: onLanguageClicked,
        ),
        SettingsWidget(
          title: locale.mode,
          selectedOption: appProvider.isDark() ? locale.dark : locale.light,
          onClicked: onModeClicked,
        ),
      ],
    );
  }

  onLanguageClicked() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }

  onModeClicked() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ModeBottomSheet(),
    );
  }
}
