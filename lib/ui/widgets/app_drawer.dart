import 'package:flutter/material.dart';
import 'package:news/ui/providers/theme_provider.dart';
import 'package:news/ui/utils/app_assets.dart';
import 'package:news/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: AppColors.white),
    );
    return Drawer(
      backgroundColor: AppColors.black,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .19,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Text(
                "News App",
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                buildDrawerActions(AppAssets.homeIcon, "Go To Home"),
                Divider(
                  height: MediaQuery.of(context).size.height * .056,
                  color: AppColors.white,
                  thickness: 1.5,
                ),
                buildDrawerActions(AppAssets.modeIcon, "Theme"),
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                DropdownButtonFormField(
                  initialValue: themeProvider.themeMode,
                  decoration: InputDecoration(
                    border: border,
                    focusedBorder: border,
                    disabledBorder: border,
                    enabledBorder: border,
                  ),
                  iconDisabledColor: AppColors.white,
                  iconEnabledColor: AppColors.white,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  dropdownColor: AppColors.black,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(16),
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text("Light"),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,

                      child: Text("Dark"),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) themeProvider.changeMode(value);
                  },
                ),
                Divider(
                  thickness: 1.5,
                  height: MediaQuery.of(context).size.height * .056,
                  color: AppColors.white,
                ),
                buildDrawerActions(AppAssets.languageIcon, "Language"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildDrawerActions(String imagePath, String text) => Row(
    children: [
      ImageIcon(AssetImage(imagePath), color: AppColors.white),
      SizedBox(width: 8),
      Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
