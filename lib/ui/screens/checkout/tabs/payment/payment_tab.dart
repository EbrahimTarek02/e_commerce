import 'dart:async';
import 'package:e_commerce/ui/screens/checkout/checkout_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment/payment_states.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment/payment_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/failure_widget.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class PaymentTab extends StatefulWidget {
  const PaymentTab({Key? key}) : super(key: key);

  @override
  State<PaymentTab> createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {

  late CheckoutViewModel checkoutViewModel;
  late PaymentViewModel viewModel;

  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    checkoutViewModel = BlocProvider.of(context);
    viewModel = BlocProvider.of(context);

    checkoutViewModel.paymentMethodIndex! < 3 ? viewModel.payWithCard() : viewModel.payWithKiosk();

    checkoutViewModel.changeScrollState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: checkoutViewModel.maxHeight - MediaQuery.sizeOf(context).height * 0.18),
      margin: EdgeInsets.only(top: checkoutViewModel.paymentMethodIndex! < 3 ? 0 : 20),
      child: Center(
        child: BlocBuilder<PaymentViewModel, PaymentStates>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is PaymentErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FailureWidget(
                    errorMessage: state.errorMessage,
                    tryAgainFunction: () {
                      checkoutViewModel.paymentMethodIndex! < 3 ? viewModel.payWithCard() : viewModel.payWithKiosk();
                    },
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,)
                ],
              );
            }
            else if (state is PaymentSuccessState) {
              if (checkoutViewModel.paymentMethodIndex! < 3) {
                PlatformWebViewControllerCreationParams params = const PlatformWebViewControllerCreationParams();

                WebViewController controller = WebViewController.fromPlatformCreationParams(params);

                controller
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setBackgroundColor(AppColors.white)
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onPageFinished: (String url) {
                        if (url.startsWith("https://accept.paymobsolutions.com/api/acceptance/post_pay")) {
                          checkoutViewModel.changePaymentState(url);
                          checkoutViewModel.changeIsPayDoneState(true);
                        }
                      },
                      onWebResourceError: (WebResourceError error) {
                        debugPrint('''
                          Page resource error:
                            code: ${error.errorCode}
                            description: ${error.description}
                            errorType: ${error.errorType}
                            isForMainFrame: ${error.isForMainFrame}
                        ''');
                      },
                      onNavigationRequest: (NavigationRequest request) {
                        return NavigationDecision.navigate;
                      },
                      onHttpError: (HttpResponseError error) {
                        debugPrint('Error occurred on page: ${error.response?.statusCode}');
                      },
                      onHttpAuthRequest: (HttpAuthRequest request) {
                        openDialog(request);
                      },
                    ),
                  )
                  ..addJavaScriptChannel(
                    'Toaster',
                    onMessageReceived: (JavaScriptMessage message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message.message)),
                      );
                    },
                  )
                  ..loadRequest(Uri.parse("https://accept.paymob.com/api/acceptance/iframes/852779?payment_token=${state.data}"));

                if (controller.platform is AndroidWebViewController) {
                  AndroidWebViewController.enableDebugging(true);
                  (controller.platform as AndroidWebViewController)
                      .setMediaPlaybackRequiresUserGesture(false);
                }

                _controller = controller;

                return WebViewWidget(
                  controller: _controller,
                );
              }
              else {
                checkoutViewModel.changeIsPayDoneState(true);
                return Column(
                  children: [
                    Image.asset(
                      AppAssets.payWitCodeIcon,
                      height: MediaQuery.sizeOf(context).height * 0.27,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),
                    Text(
                      "Order Reference Number",
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      state.data,
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "To pay go to nearest Aman, Massary, Momken or Sadad outlet and ask for مدفوعات اكسبت and provide your reference number.",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "Code will expire after 24 hours",
                      style: GoogleFonts.poppins(
                          color: AppColors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                );
              }
            }
            else {
              return const CircularProgressIndicator(color: AppColors.primaryColor,);
            }
          },
        ),
      ),
    );
  }

  Future<void> openDialog(HttpAuthRequest httpRequest) async {
    final TextEditingController usernameTextController =
    TextEditingController();
    final TextEditingController passwordTextController =
    TextEditingController();

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${httpRequest.host}: ${httpRequest.realm ?? '-'}'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  autofocus: true,
                  controller: usernameTextController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  controller: passwordTextController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // Explicitly cancel the request on iOS as the OS does not emit new
            // requests when a previous request is pending.
            TextButton(
              onPressed: () {
                httpRequest.onCancel();
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                httpRequest.onProceed(
                  WebViewCredential(
                    user: usernameTextController.text,
                    password: passwordTextController.text,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Authenticate'),
            ),
          ],
        );
      },
    );
  }

}


