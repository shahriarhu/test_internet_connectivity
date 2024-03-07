import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:test_first/no_internet_view.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    var cancel;
    return NoInternetView(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('This is second view'),
              ElevatedButton(
                onPressed: () {
                  // simpleNotificationWidget(message: 'Show Notification');
                  cancel = BotToast.showSimpleNotification(title: "xxxx", duration: Duration(days: 1));
                },
                child: const Text('Show Notification'),
              ),
              ElevatedButton(
                onPressed: () {
                  // simpleNotificationWidget(message: 'Show Notification');
                  //  cancel = BotToast.showSimpleNotification(title: "xxxx");
                  if (cancel != null) {
                    cancel();
                  }
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
