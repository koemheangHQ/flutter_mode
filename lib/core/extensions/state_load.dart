import 'package:fluuter_model/core/utils/enum.dart';

extension StateLoad on StateIdle {
  String get getStatus {
    switch (this) {
      case StateIdle.loading:
        return "Loading";
      case StateIdle.error:
        return "Error";
      case StateIdle.success:
        return "Success";
    }
  }
}
