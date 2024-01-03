import 'package:flutter/material.dart';

class PermHeader extends StatelessWidget {
  const PermHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/gear.png',
                  height: 100.0,
                  width: 100.0,
                ),
              ),
              const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Takila',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    Text(
                      'V: 0.0.1',
                      style: TextStyle(color: Colors.green),
                    ),
                  ])
            ]),
        const SizedBox(height: 18),
        const Text(
            'This app requires various permissions so that make calls with Takila without any worries.')
      ],
    );
  }
}
