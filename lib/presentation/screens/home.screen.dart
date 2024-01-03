import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_permissions/application/permission/permission.bloc.dart';
import '../widgets/widgets.barrel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PermissionBloc(),
        child: BlocListener<PermissionBloc, PermissionState>(
            listener: (context, state) {},
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  title: Text(title),
                ),
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const PermHeader(),
                      const SizedBox(height: 20),
                      PermBody()
                    ],
                  ),
                ))));
  }
}
