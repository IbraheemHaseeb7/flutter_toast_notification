# Toast Notification

## Features

Allows you to display toast message with custom set duration or shut it down whenever you want.

- Set Custom Messages for Notifications
- Set duration for it show
- Don't set duration and shut it down whenever you want, maybe on a server response.

## Getting started

This toast notification can be on any page provided that the page is wrapped in `Stack` and our package is part of the children of `Stack`. You can read useage or examples for better understandings.

## Usage

### _Installation_

Run the following command in your terminal to install the package.

```shell
flutter pub get toast_notification
```

Alternatively you can add the following lines in your `pubsec.yaml` file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  toast_notification: 1.0.0
```

### _Basic Setup_

Add this snippet somewhere in your code, maybe on a function call...

```dart
onClick() {
    ToastMe(
        text: "Successfully posted something",
        type: ToasterType.Check).showToast(context);
}
```

### _Example of toast notification_

![Examples of toast notification](https://raw.githubusercontent.com/IbraheemHaseeb7/flutter_toast_notification/main/gifs/toasterGif.gif)
<br />
Code for the shown example:

```dart
ToastMe(
    text: "Invalid OTP, try again!",
    type: ToasterType.Error,
    controller: toasterController,).showToast(context);
```

## Additional information

Besides these basic options, this notification comes with several other options for you to work with in order to customize this toast notification according to your apps needs.

### _Types_

There are currently three types but we plan to add more types in the future.

- `ToasterType.Loading`
- `ToasterType.Check`
- `ToasterType.Error`

### _Colors of Various Parts_

By default the colors for the icon and text is set to `white` and the background color is set to `#1a1a1a`. If you want to set custom colors, you can do it like so.

```dart
ToastMe(
    text: "Successfully completed something",
    type: ToasterType.Check,
    controller: toasterController,
    iconColor: Colors.white,
    backgroundColor: Colors.black,
    textColor: Colors.white).showToast(context);
```

### _Without Duration_

If you will not set the duration the default behaviour for the notification will be that it won't go down unless you call this function.

```dart
toasterController.end();
```

### _With Duration_

If you set the duration as given below, what would happen is that toast notification would automatically go down after the given time. Note that duration is given in `miliseconds` and its data type is `int?`.

Create the controller somewhere on the top first preferbly out of the `builder function`.

```dart
final ToasterController toasterController = ToasterController();
```

```dart
ToastMe(
    data: "Successfully posted something",
    type: ToasterType.Check,
    duration: 2000 // in miliseconds
    ).showToast(context);
```

### _Change Text Later on_

You can also change the text later in the application for whatever the reasons may be using the controller like so.

```dart
toasterController.setData("Some new text");
```

## Get in touch

Hi there, this is Ibraheem Bin Haseeb, student and a software engineer. If you want to hire me for your web applications, mobile applications, or desktop applications feel free to get in touch with me here...
<br />
<br />
<a style="margin: 1rem;" href="mailto:ibraheemhaseeb7@gmail.com">
<button style="background-color: #1a1a1a; color: white; padding: 0.5rem 1rem; cursor: pointer; border-radius: 8px; border: 1px solid white">Email Me</button>
</a>
<a href="https://wa.me/923334574770">
<button style="background-color: #1a1a1a; color: white; padding: 0.5rem 1rem; cursor: pointer; border-radius: 8px; border: 1px solid white">Whatsapp</button>
</a>
