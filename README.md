# Boiler plate Flutter mobile application

## Features
- BLoc
- Internationalizaion 
- Navigation
- Lottie animation


# Running the app.
The application is environmentalized.

All the values that can be different per envionment are housed in [env.dart](lib/common/constants)

Currently, there are three environments added, `development`, `staging` and `production`.

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
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Dev",
            "type": "dart",
            "request": "launch",
            "program": "lib/main_development.dart"
        },
        {
            "name": "Stage",
            "type": "dart",
            "request": "launch",
            "program": "lib/main_staging.dart"
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
### To run a release of staging version of the app
```bash
flutter clean
flutter build apk --release lib/main_staging.dart
```

### To run a release of production version of the app
```bash
flutter clean
flutter build apk --release lib/main_production.dart
```

### Lottie animation
The animation in the project is downloaded from [here](https://lottiefiles.com/24574-love-pride-heart).

## Project structure
```bash
.
├── app
├── common
│   ├── base
│   ├── bloc
│   │   └── connectivity
│   ├── constants
│   ├── network
│   ├── preference
│   ├── routes
│   ├── ui
│   ├── utils
│   └── widget
├── feature
│   ├── authentication
│   │   ├── bloc
│   │   └── repositories
│   ├── home
│   │   ├── bloc
│   │   ├── models
│   │   ├── services
│   │   └── ui
│   │       ├── screen
│   │       └── widget
│   ├── landing
│   │   └── ui
│   ├── signin
│   │   ├── bloc
│   │   ├── services
│   │   └── ui
│   ├── signup
│   │   ├── bloc
│   │   ├── services
│   │   └── ui
│   └── welcome
│       └── ui
├── generated
│   └── intl
├── l10n
├── main_development.dart   # To be used for development
├── main_production.dart    # To be used for production
└── main_staging.dart       # To be used for staging
```