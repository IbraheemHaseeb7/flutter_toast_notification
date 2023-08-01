# Toast Notification Example

It demonstrates how the both versions of our toast notificaiton work.

## With Duration

![Examples of toast notification](https://raw.githubusercontent.com/IbraheemHaseeb7/flutter_toast_notification/main/gifs/withDuration.gif)

Toast Message will automatically close after `2 seconds`.

```dart
ToastMe(
    text: "Hello World",
    type: ToasterType.Check,
    duration: 2000).showToast(context); //miliseconds
```

## Without Duration

![Examples of toast notification](https://raw.githubusercontent.com/IbraheemHaseeb7/flutter_toast_notification/main/gifs/withoutDuration.gif)

Display toast message by...

`NOTE: Make sure you have controller to close it later on.`

```dart
ToastMe(
    text: "Hello World",
    type: ToasterType.Check,
    controller: toasterController).showToast(context);
```

And shut the toast notification by...

```dart
toasterController.end();
```
