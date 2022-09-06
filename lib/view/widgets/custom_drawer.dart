import 'package:news_app/view/widgets/my_text.dart';

import '../../../../controller/dark_mode_controller.dart';
import '../../../../const/const.dart';
import 'custom_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List title = [
    ['News History', 'assets/icons/shopping-bag.png'],
    ['Your favorite', 'assets/icons/heart.png'],
    ['Dark mode', 'assets/icons/night.png'],
    ['Trending', 'assets/icons/tag.png'],
    ['Settings', 'assets/icons/setting.png'],
    ['Log out', 'assets/icons/power-off.png']
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            DrawerHeader(
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    ClipOval(
                      child: Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.contain,
                          )),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 5,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: GetBuilder<DarkModeController>(
                          builder: (darkModeController) => Icon(
                            Icons.camera_alt_outlined,
                            color: darkModeController.getThemeFromBox()
                                ? Colors.purple
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MyText(
              text: '@zacEvron',
              fontsize: 25,
            ),
            GetBuilder<DarkModeController>(
              builder: (darkModeController) => ListView.builder(
                shrinkWrap: true,
                itemCount: title.length,
                itemBuilder: (ctx, i) {
                  return GetBuilder<DarkModeController>(
                    builder: (darkModeController) => CustomDrawerItem(
                      leading: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          title[i][1],
                          color: title[i][0] == 'Log out'
                              ? Colors.red
                              : darkModeController.getThemeFromBox()
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                      onTap: () {},
                      title: title[i][0],
                      trailing: title[i][0] == 'Dark mode'
                          ? GetBuilder<DarkModeController>(
                              builder: (darkModeController) => Switch(
                                value: darkModeController.getThemeFromBox(),
                                activeColor: Colors.deepPurple,
                                onChanged: (v) {
                                  darkModeController.switchTheme();
                                },
                              ),
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
