// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'permItem.widget.dart';

class PermBody extends StatelessWidget {
  PermBody({super.key});
  final permissions = {
    '1': {
      'name': 'camera',
      'label': 'Camera',
      'description': 'Need to make video calls within the app.',
      'icon': const Icon(Icons.camera, size: 40)
    },
    '2': {
      'name': 'mic',
      'label': 'Microphone',
      'description': 'Need to talk with Talkia.',
      'icon': const Icon(Icons.mic, size: 40)
    },
    '3': {
      'name': 'files',
      'label': 'FileSystem',
      'description': 'Need to select images from filesystem for profile image.',
      'icon': const Icon(Icons.list, size: 40),
    },
    '4': {
      'name': 'notification',
      'label': 'Notifications',
      'description': 'Required to receive notification from Talkia',
      'icon': const Icon(
        Icons.notifications_active,
        size: 40,
      ),
    }
  };
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Name',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Status',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(thickness: 1),
              PermItem(prmItm: permissions["1"]),
              Divider(thickness: 1),
              PermItem(prmItm: permissions["2"]),
              Divider(thickness: 1),
              PermItem(prmItm: permissions["3"]),
              Divider(thickness: 1),
              PermItem(prmItm: permissions["4"]),
              Divider(thickness: 1),
            ]),
          ),
        ]);
  }
}
