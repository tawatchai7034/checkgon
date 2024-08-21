import 'dart:io';

import 'package:checkgon/common/ui_helpers.dart';
import 'package:checkgon/view.models/call.state.view.model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_state/phone_state.dart';
import 'package:provider/provider.dart';

class CallStateView extends StatefulWidget {
  const CallStateView({super.key});

  @override
  State<CallStateView> createState() => _CallStateViewState();
}

class _CallStateViewState extends State<CallStateView> {
  @override
  Widget build(BuildContext context) {
    CallStateViewModel viewModel =
        Provider.of<CallStateViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call State"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Button to request phone permissions on Android
            if (Platform.isAndroid)
              ElevatedButton(
                onPressed: !viewModel.granted
                    ? () async {
                        await viewModel.requestPermission();

                        // Display a toast message when permissions are granted successfully
                        Fluttertoast.showToast(
                            msg: 'Permissions Granted Successfully');
                      }
                    : () {
                        // Display a toast message when permissions are already granted
                        Fluttertoast.showToast(msg: 'Permissions Are Granted');
                      },
                child: const Text("Request Phone Permission"),
              ),
            const Text(
              "Status of Call",
              style: TextStyle(fontSize: 24),
            ),
            verticalSpaceMedium,

            // StreamBuilder to react to changes in phone call state
            StreamBuilder(
              initialData: PhoneState.nothing(),
              stream: PhoneState.stream,
              builder: (context, snapshot) {
                final phoneState = snapshot.data;

                if (phoneState == null) {
                  // Handle the case when snapshot data is null
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                switch (phoneState.status) {
                  case PhoneStateStatus.CALL_ENDED:

                    // (Optional) Upload PDF to Supabase after the call ends
                    // viewModel.uploadPdfToSupabase(pdfFilePath);

                    return Icon(
                      viewModel.getIcons(phoneState.status),
                      color: viewModel.getColor(phoneState.status),
                      size: 80,
                    );
                  case PhoneStateStatus.CALL_INCOMING:
                  case PhoneStateStatus.CALL_STARTED:
                    return Column(
                      children: [
                        Text(
                          "Number: ${phoneState.number}",
                          style: const TextStyle(fontSize: 24),
                        ),
                        verticalSpaceMedium,
                        Icon(
                          viewModel.getIcons(phoneState.status),
                          color: viewModel.getColor(phoneState.status),
                          size: 80,
                        ),
                      ],
                    );
                  case PhoneStateStatus.NOTHING:
                    return const Text(
                      "Nobody has called you yet!",
                      style: TextStyle(fontSize: 24),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
