import 'dart:async';

Future callApi(FutureOr Function() request,
    {bool loading = true,
    bool showToast = true,
    Function(Object error)? onError}) async {
  try {
    //if (loading) showLoading();
    await request();
    // hideInterruptLoading();
  } catch (e, s) {
    //s.log("Call api");
    onError?.call(e);
    if (showToast) {
      //toast(e.toString());
    }
  } finally {
    //if (loading) hideLoading();
  }
}
