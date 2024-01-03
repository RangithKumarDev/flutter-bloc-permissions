import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_permissions/application/permission/permission.bloc.dart';

class PermItem extends StatelessWidget {
  final Map<String, dynamic>? prmItm;
  const PermItem({super.key, required this.prmItm});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocConsumer<PermissionBloc, PermissionState>(
          listener: (context, state) {
        if (state.error != '') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
          state.error = '';
        }
      }, builder: (context, state) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<PermissionBloc>().add(GetPermission(
                        permName: prmItm?['name'],
                        status: state.permissions[prmItm?['name']] ?? false));
                  },
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        prmItm?['icon'],
                        Text(prmItm?['label'],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                            (state.permissions[prmItm?['name']] ?? false)
                                ? 'Given'
                                : 'Needed',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text(prmItm?['description'],
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                    // permissions.map((e) => null)
                  ]),
                ),
              ),
            ]);
      });
    });
  }
}
