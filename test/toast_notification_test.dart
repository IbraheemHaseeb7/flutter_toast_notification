import 'package:flutter_test/flutter_test.dart';
import 'package:toast_notification/ToasterController.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

void main() {
  test('sets the data for the toast', () {
    final ToasterController toasterController = ToasterController();
    ToastMe(
        text: "This is testing",
        controller: toasterController,
        type: ToasterType.Loading);
    expect(toasterController.setData("testing"), "testing");
  });
}
