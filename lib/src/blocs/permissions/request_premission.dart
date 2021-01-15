import 'package:permission_handler/permission_handler.dart';

Future<int> requestPermissions(Permission permission) async {
  Map<Permission, PermissionStatus> statuses = await [permission].request();
  //statuses[permission] == PermissionStatus.granted
  if (statuses[permission].isGranted) {
    return 0;
  }
  if (statuses[permission].isDenied) {
    return 1;
  }
  if (statuses[permission].isPermanentlyDenied) {
    return 2;
  }
  if (statuses[permission].isRestricted) {
    return 3;
  }
  //statuses[permission].isUndetermined
  return 4;
} /*Checking if your App has been Given Permission*/
