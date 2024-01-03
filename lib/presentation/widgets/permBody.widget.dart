// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_permissions/presentation/widgets/permitem.widget.dart';

class PermBody extends StatelessWidget {
  PermBody({super.key});
  final permissions = [
    {
      'name': 'camera',
      'label': 'Camera',
      'description': 'Need to make video calls within the app.',
      'icon': const Icon(Icons.camera)
    },
    {
      'name': 'mic',
      'label': 'Microphone',
      'description': 'Need to talk with Talkia.',
      'icon': const Icon(Icons.mic)
    },
    {
      'name': 'files',
      'label': 'FileSystem',
      'description': 'Need to select images from filesystem for profile image.',
      'icon': const Icon(Icons.list),
    },
    {
      'name': 'notify',
      'label': 'Notifications',
      'description': 'Required to receive notification from Talkia',
      'icon': const Icon(Icons.notifications_active),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Expanded(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Name',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Status',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(thickness: 1),
              // permissions.map((prm) => PermItem(prm)).toList(),
            ]),
          ),
        ]);
  }
}
