//Eager Singleton
import 'dart:developer';

import 'package:flutter_use_cases/use_case/generic_loc/core/logger_mixin.dart';

class ProjectLoggerEager {
  static final ProjectLoggerEager _instance = ProjectLoggerEager._internal();
  factory ProjectLoggerEager() {
    return _instance;
  }
  ProjectLoggerEager._internal();
}

//Lazy Singleton
class ProjectLoggerLazy {
  static ProjectLoggerLazy? _instance;
  factory ProjectLoggerLazy() {
    _instance ??= ProjectLoggerLazy._init();
    return _instance!;
  }
  ProjectLoggerLazy._init();

  void logClassName<T>(T page) {
    log(page.toString());
  }

  void logPageName(PageSpecialKeys keys) {
    log(keys.name.toString());
  }

  void logCustomModel(CustomModel model) {
    log(model.toJson());
  }
}
