<h1 align="center">
  📱 Marvel Guide 📚
</h1>

<p align="center">
  <img alt="License" src="https://img.shields.io/static/v1?label=license&message=MIT&color=B5161B&labelColor=EC1D24">
</p>

## 💻 Project

A Marvel Heroes and Comics guide, built with Flutter and MarvelAPI to help people get to know more about this amazing universe!

## :hammer_and_wrench: Features

- [ ] Firebase Auth;
- [ ] Firebase Firestore;
- [ ] Infinite Scrolling;
- [ ] Paginated Requests;
- [ ] Rest API;
- [ ] Form Validation;
- [ ] Animations;
- [ ] Loading Effects;

## ✨ Technologies

- [ ] Flutter
- [ ] Lottie
- [ ] LocalStorage
- [ ] Http
- [ ] MarvelAPI
- [ ] MVC

## 🔖 Layout

![ilustration](.github/ilustration.png?style=flat)
![ilustration2](.github/ilustration2.png?style=flat)

## 👨‍💻 Getting started

git clone this project and install flutter dependencies.

```dart
git clone
flutter pub get
```

In order to consume the MarvelAPI, create an account on https://developer.marvel.com and place your keys in the folowing file:

```dart
// marvel_api.dart
static final publicKey = YOUR_PUBLIC_KEY;
static final privateKey = YOUR_PRIVATE_KEY;
```

Setup a new firebase project with email and password authentication and firestore and paste the config in the config folder.

```dart
// config/firebase_options.dart
class DefaultFirebaseOptions {
  // Your config here  
}
```

## 📄 Licence

This project is under MIT license. Check the [LICENSE](LICENSE.md) file for more details.

<br />
