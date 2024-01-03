part of 'permission.bloc.dart';

@immutable
class PermissionEvent {}

class GetPermission extends PermissionEvent {
  final String permName;
  final bool status;
  GetPermission({required this.permName, required this.status});
}
