import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:construction_mate/logic/controllers/network/network_bloc.dart';
import 'package:construction_mate/logic/controllers/network/network_event_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen(
      (event) {
        if (event.contains(ConnectivityResult.none)) {
          NetworkBloc().add(NetworkNotify());
        } else {
          NetworkBloc().add(NetworkNotify(isConnected: true));
        }
      },
    );
  }
}
