import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

// Helper service for Permission handling;
class PermissionRequestService {
  // Static method to handle Permission request;
  static Future<Map<String, bool>> handlePermRequest(
      {required String permName}) async {
    Map<String, bool> state;
    Permission perm;
    switch (permName) {
      case 'camera':
        perm = Permission.camera;
        break;
      case 'mic':
        perm = Permission.microphone;
        break;
      case 'notification':
        perm = Permission.notification;
        break;
      case 'files':
        perm = Permission.storage;
        break;
      default:
        perm = Permission.camera;
    }
    if (perm != null) {
      log(perm.toString());
      log(permName);
      PermissionStatus status = await perm.status;
      log(status.toString());
      switch (status) {
        case PermissionStatus.granted:
          state = {'perm': true};
          break;
        case PermissionStatus.denied:
          // Need to get permission again;
          await perm.request();
          state = {'perm': true};
          break;
        case PermissionStatus.restricted:
          state = {'perm': true, 'partial': true};
          break;
        case PermissionStatus.permanentlyDenied:
          state = {'perm': false, 'static': true};
          break;
        case PermissionStatus.limited:
          state = {'perm': true, 'limited': true};
          break;
        case PermissionStatus.provisional:
          state = {'perm': true, 'provisional': true};
          break;
        default:
          state = {'perm': false, 'none': false};
      }
    } else {
      state = {'perm': false, 'none': false};
    }
    return state;
  }
}
