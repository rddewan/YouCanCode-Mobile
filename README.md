# youcancode

A new Flutter project.

# Build Command
- Android Build Debug
```bash
flutter build apk --debug --build-name=1.0.0 --build-number=1
```
- Android Build Release
```bash
flutter build appbundle --release --build-name=1.0.0 --build-number=1
```
- Build ios Debug
```bash
flutter build ios --debug --build-name=1.0.0 --build-number=1 --no-codesign
```
- Build ios Release
```bash
flutter build ipa --release --export-options-plist ios/export_options.plist  --build-name=1.0.0 --build-number=1
```
