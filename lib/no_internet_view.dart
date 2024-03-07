import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_first/network_service.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var networkStatus = Provider.of<NetworkStatus>(context);

    return Scaffold(
      body: networkStatus == NetworkStatus.online
          ? child
          : const Center(
              child: Icon(
                Icons.wifi_off_rounded,
                size: 100,
                color: Colors.red,
              ),
            ),
    );
  }
}
