import 'package:permission_handler/permission_handler.dart';

class PermissionRequestService {
  static Future<Map<String, bool>> handlePermRequest(
      {required String permName}) async {
    Map<String, bool> state;
    dynamic perm;
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
        perm = null;
    }
    if (perm != null) {
      PermissionStatus status = await perm.status;
      switch (status) {
        case PermissionStatus.granted:
          state = {'perm': true};
          break;
        case PermissionStatus.denied:
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
          state = {'perm': false, 'limited': true};
          break;
        case PermissionStatus.provisional:
          state = {'perm': false, 'provisional': true};
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
