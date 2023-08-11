# App Checker Flutter Native Module

A Flutter native module that allows you to check if a specific app is installed on the device using a custom schema. This module supports both Android and iOS platforms.

## Installation

To use this module, follow these steps:

1. Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  app_checker:
    git: https://github.com/your-username/app-checker.git

```

2. Run `flutter pub get`.
3. Import the module in your Dart code:
    
```dart
import 'package:app_checker/app_checker.dart';
```

## Usage
### Check if an App is Installed
You can use the isAppInstalled method to check if a specific app is installed on the device using its schema. Here's how you can use it:

```dart
bool isInstalled = await AppChecker.isAppInstalled("app-schema");
if (isInstalled) {
  print("The app is installed.");
} else {
  print("The app is not installed.");
}
```

Replace "app-schema" with the schema of the app you want to check.

## Contributing
Contributions are welcome! If you encounter any issues or would like to contribute to the project, feel free to create an issue or submit a pull request.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

```vbnet

Make sure to replace `"app-schema"` with the actual schema of the app you want to check. Also, update the URL in the dependency section to point to your repository.

Remember to place this README file in the root directory of your Flutter native module repository. It provides clear instructions on how to install and use your module and offers guidance for potential contributors.
``````