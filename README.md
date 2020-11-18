# Flutter boiler plate project 

A new Flutter project.

## Features
- Authentication with Firebase
- BLoC architecture
- Internationalization
- Environmnetalized application
- Navigation

# Running the app.
The application is environmentalized.

All the values that can be different per envionment are housed in [environment.dart](lib/common/constants)

Currently, there are three environments added, `development` and `production`.

## Get Firebase configuration for iOS and Android.
Follow this [guide](https://firebase.google.com/docs/flutter/setup?platform=ios) and get credentials for Android and iOS.

- Change the package of the project from `com.flutter.mobile` to `your.package.com`
- Change the name of the application from `flutter_mobile_application` to `your_application_name`
- Create a Firebase project in [console](https://firebase.google.com/). 
- Add `android` and `ios` apps
- Replace `google-services.json` present in `/android/app/google-services.json` with the one you created
- Replace `GoogleService-Info.plist` present in `/ios/Runner/GoogleService-Info.plist` with the one you created
- Once replaced, build the app and the app should be able to interact with Firebase.


## Running the app locally 
> Make sure everything is installed by running `flutter doctor`

- Run an emulator
- Run `flutter run lib/main_developement.dart`. This will run the app with developement env variables.

## Flutter VSCode Plugins to make life easier
- Flutter
- Awesome Flutter Snippets
- Flutter Intl

You can add confugurations in the `run` section for the various evironments:

```json
{
    "configurations": [
        {
            "name": "Dev",
            "type": "dart",
            "request": "launch",
            "program": "lib/main_development.dart"
        },
        {
            "name": "Prod",
            "type": "dart",
            "request": "launch",
            "program": "lib/main_production.dart"
        }
    ]
}
```

# Application model
[json_serializable](https://pub.dev/packages/json_serializable) and [json_annotation](https://pub.dev/packages/json_annotation) is used to generate code for JSON serialization and deserialization.

`*.g.dart` file is generate per model class that has all the generated code. 

## Generating serialization and deserialization code
- Add a model under a `models` folder in a `feature` package.
- annotate with `json_annotations` as shown in this [example](https://github.com/dart-lang/json_serializable/tree/master/example)
- Run `flutter pub run build_runner build`. The generated files will be placed in the same folder as the original model.
- DO NOT EDIT the `*.g.dart` files manually. Any subsequent build will replace the manually edited files.
 > You might see some errors but it can be ignored.
# Application content
> Default language, `en` is already added.

[intl_utils](https://pub.dev/packages/intl_utils) is used to generate contents for the app.

Content is generated from `intl_<lang>.arb` files in [l10n](/lib/l10n). <br/>
Content classes are generates in compile time and used to refer the content `strings`. A `generated` folder contains all the content.

## Generating content from `*.arb`
To generate content
- Add `intl_<lang>.arb` under [l10n](/lib/l10n) folder.
- Run `flutter pub run intl_utils:generate` to generate content classes for the languages.
- Make sure to add the files in `vcs`
- DO NOT EDIT the content files manually. Any subsequent build will replace the manually edited files.

## Running a release 

### To run a release of development version of the app
```bash
flutter clean
flutter build apk --release lib/main_development.dart
```

### To run a release of production version of the app
```bash
flutter clean
flutter build apk --release lib/main_production.dart
```

### Folder structure
```bash
.
├── assets
│   └── images
└── lib
    ├── app
    ├── common
    │   ├── bloc
    │   │   └── connectivity
    │   ├── constants
    │   ├── network
    │   ├── routes
    │   ├── styles
    │   └── widgets
    ├── features
    │   ├── authentication
    │   │   ├── bloc
    │   │   └── repository
    │   ├── landing
    │   │   └── ui
    │   ├── main
    │   │   ├── bloc
    │   │   ├── models
    │   │   ├── pages
    │   │   │   ├── account
    │   │   │   │   ├── bloc
    │   │   │   │   ├── repositories
    │   │   │   │   └── ui
    │   │   │   │       └── widgets
    │   │   │   ├── feed
    │   │   │   │   └── ui
    │   │   │   ├── home
    │   │   │   │   └── ui
    │   │   │   └── notification
    │   │   │       └── ui
    │   │   ├── repositories
    │   │   └── ui
    │   │       └── widgets
    │   ├── signin
    │   │   ├── bloc
    │   │   ├── respositories
    │   │   └── ui
    │   │       └── widgets
    │   └── signup
    │       ├── bloc
    │       ├── respositories
    │       └── ui
    │           └── widgets
    ├── generated
    │   └── intl
    └── l10n
```
### Screenshots

<img src="/screenshots/signInPage.png" width="300" />
<img src="/screenshots/signUpPage.png" width="300" />
<img src="/screenshots/signInFailure.png" width="300" />
<img src="/screenshots/signUpFailure.png" width="300" />
<img src="/screenshots/signInSuccess.png" width="300" />
<img src="/screenshots/signOut.png" width="300" />

