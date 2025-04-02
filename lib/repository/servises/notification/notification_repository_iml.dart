import 'package:epolisplus/models/models_export.dart';

abstract class NotificationRepositoryIml {
  Future<BaseModels> getNotification();
  Future<BaseModels> allNotification();
}
