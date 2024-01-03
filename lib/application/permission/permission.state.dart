part of 'permission.bloc.dart';

class PermissionState {
  Map<String, bool> permissions;
  String error;
  PermissionState({required this.permissions, required this.error});
}

class PermissionStateInitial extends PermissionState {
  PermissionStateInitial({required permissions, required error})
      : super(permissions: permissions, error: error);
}

class PermissionStateUpdate extends PermissionState {
  PermissionStateUpdate({required permissions, required error})
      : super(permissions: permissions, error: error);
}
