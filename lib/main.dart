import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/core/utilities/injectors/dependency_injector.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const CloudwalkAssessment());
}
