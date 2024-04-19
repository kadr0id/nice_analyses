nice_analyses
This is a project to show my approach to programming and show how I would start a new project. 
Nice analyses

Getting Started 🚀
Running Tests 🧪
To run all unit and widget tests use the following command:

$ flutter test --coverage --test-randomize-ordering-seed random
To view the generated coverage report you can use lcov.

# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
Generating assets 🖼️
We're using flutter_gen to generate statically safe descriptions of image and font assets.

You need to install the flutter_gen tool via brew or pub, by following the installation instruction. The configuration of the tool is stored in pubspec.yaml.

After that you can easily recreate the assets descriptions by calling:

$> fluttergen
Then to reference the asset you can call:

Assets.images.unicornVgvBlack.image(height: 120),
If you're adding new assets to ui library, make sure to run fluttergen inside the package directory as well.

Working with Translations 🌐
This project relies on flutter_localizations and follows the official internationalization guide for Flutter.

Adding Strings
To add a new localizable string, open the app_en.arb file at lib/l10n/arb/app_en.arb.
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the NiceApp of the Counter Page"
    }
}
Then add a new key/value and description
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the NiceApp of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
Use the new string
import 'package:abra/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
Adding Supported Locales
Update the CFBundleLocalizations array in the Info.plist at ios/Runner/Info.plist to include the new locale.

    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
Adding Translations
For each supported locale, add a new ARB file in lib/l10n/arb.
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
Add the translated strings to each .arb file:
app_en.arb

{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
app_es.arb

{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
