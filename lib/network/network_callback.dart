abstract class NetworkCallback {
  void onStart(){}

  void onFinish(){}
}
// abstract class AbsClass{
//
//   void onCall(NetworkCallback callback);
// }
//
// class Impl extends AbsClass{
//   @override
//   void onCall(NetworkCallback callback) {
//     // TODO: implement onCall
//   }
//
// }
//
// class CallImpl{
//
//   void onOk(){
//     Impl _impl= Impl();
//     NetworkCallback callback=NetworkCallback();
//     _impl.onCall(callback);
//   }
// }