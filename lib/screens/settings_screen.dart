// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:settings_ui/settings_ui.dart';
import '../Utils/custom_snackbar.dart';
import '../services/theme_services.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool dell = true;
    bool dell2 = true;
    bool dell3 = true;

    //TODO Settings Screen
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text('User Settings'),
      ),
      body:




      SettingsList(
        sections: [
          SettingsSection(
            title: Text('Appearance & Profile'),
            tiles: [
              SettingsTile.navigation(
                leading: Icon(Icons.person_3),
                title: Text('Change Username'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.nightlight_round),
                title: Text('Toggle Dark Mode'),
                onPressed: (context) {
                  snackUndo("Theme Changed", () {});
                  ThemeServices().switchTheme();
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text('Features'),
            tiles: [
              SettingsTile.navigation(
                leading: Icon(Icons.swipe),
                title: Text('Notification'),
                onPressed: (context) {
                  if (dell2 == true) {
                    snackUndo("Notification Enabled", () {
                      clearSnackbar();
                    });
                    ;
                    dell2 = false;
                  } else {
                    snackUndo("Notification Disabled", () {
                      clearSnackbar();
                    });
                    ;
                    dell2 = true;
                  }
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.music_note),
                title: Text('Sound'),
                onPressed: (context) {
                  if (dell3 == true) {
                    snackUndo("Sound Enabled", () {
                      clearSnackbar();
                    });
                    ;
                    dell3 = false;
                  } else {
                    snackUndo("Sound Disabled", () {
                      clearSnackbar();
                    });
                    ;
                    dell3 = true;
                  }
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.vibration),
                title: Text('Vibration'),
                onPressed: (context) {
                  if (dell == true) {
                    snackUndo("Vibration Enabled", () {
                      clearSnackbar();
                    });
                    ;
                    dell = false;
                  } else {
                    snackUndo("Vibration Disabled", () {
                      clearSnackbar();
                    });
                    ;
                    dell = true;
                  }
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text('About'),
            tiles: [
              SettingsTile.navigation(
                leading: Icon(Icons.code),
                title: Text('Source Code'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.email),
                title: Text('Contact'),
                onPressed: (context) {
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.shield),
                title: Text('Privacy'),
                onPressed: (context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
