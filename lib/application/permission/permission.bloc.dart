import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_permissions/services/permissionRequest.service.dart';
part 'permission.event.dart';
part 'permission.state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc()
      : super(PermissionStateInitial(permissions: {
          'camera': false,
          'mic': false,
          'files': false,
          'notification': false
        }, error: '')) {
    on<GetPermission>(_getPermission);
  }
  Future<void> _getPermission(
      GetPermission event, Emitter<PermissionState> emit) async {
    if (event.status == true) {
      state.permissions[event.permName] = false;
      emit(PermissionStateUpdate(permissions: state.permissions, error: ''));
    } else {
      var status = await PermissionRequestService.handlePermRequest(
          permName: event.permName);
      String err = '';
      if (status['perm'] == false) {
        if (status.keys.contains('none')) {
          err = 'Unexpected error occurred!';
        } else {
          err = 'Denied Permanently! Try enable from settings app.';
        }
        emit(PermissionStateUpdate(permissions: state.permissions, error: err));
      } else {
        if (status.keys.contains('limited')) {
          err = 'Given Limited access!';
        } else if (status.keys.contains('provisional')) {
          err = 'Given Provisional access only!';
        } else if (status.keys.contains('partial')) {
          err = 'Given Partial access! Parental controls.';
        } else {
          err = 'Access Granted.';
        }
      }
      state.permissions[event.permName] = status['perm'] ?? false;
      emit(PermissionStateUpdate(permissions: state.permissions, error: err));
    }
  }
}
