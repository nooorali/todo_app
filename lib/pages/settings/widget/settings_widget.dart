import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final String title;
  final String selectedOption;
  final Function onClicked;
  const SettingsWidget({super.key,required this.title,required this.selectedOption,required this.onClicked});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return  GestureDetector(
      onTap: () {
        onClicked();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
            child: Text(
              title,
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSecondary),

            ),
          ),
          Container(
            width: mediaQuery.width,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 30,),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            decoration: BoxDecoration(
                color: theme.colorScheme.onBackground,
                border: Border.all(
                  color: theme.primaryColor,
                  width: 1.2,
                  style: BorderStyle.solid,
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedOption,style: theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),),
                Icon(Icons.keyboard_arrow_down_sharp,size: 18,color: theme.primaryColor,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
