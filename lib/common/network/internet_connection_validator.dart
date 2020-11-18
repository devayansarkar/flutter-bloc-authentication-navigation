import 'package:connectivity/connectivity.dart';

class InternetConnectionValidator {
  Future<bool> check() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi)
      return true;
    else if (result == ConnectivityResult.none)
      return false;
    else
      return false;
  }

  dynamic checkInternet(Function function) {
    check().then((internet) => {
          if (internet != null && internet) function(true) else function(false)
        });
  }
}
