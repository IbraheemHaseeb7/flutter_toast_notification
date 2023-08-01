// ignore_for_file: file_names

/// Toaster Controller class offers your three functions that
/// can be used to perform various functions later when calling the
/// toast notification.
///
/// It is especially intended to be used when you are calling
/// toast notification without the duration.
class ToasterController {
  /// start function is used to start the notification
  late Function start;

  /// end function is used to end the toast that was called
  /// without the duration arguement
  late Function end;

  /// setData function takes in string that can be used
  /// to change the text of the toast notification later
  /// on
  late Function(String) setData;
}
