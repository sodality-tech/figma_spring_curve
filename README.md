<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Figma Spring Curve

Dart implementation of figma's spring curves, and a collection of their built in spring curves.

Based on Figma's [blog post about spring animations](https://www.figma.com/blog/how-we-built-spring-animations/) 

## Features

- FigmaSpringCurve class that allows you to define a spring curve using stiffness, damping and mass
- 4 Predefined curves that are built-in on figma

## Getting started

- Run `flutter pub add figma_spring_curve`

## Usage

```dart
final curve = FigmaSpringCurve(300, 20, 1);
final bouncyCurve = FigmaSpringCurve.bouncy;
```

## Additional information



- This packaged was developed in house by the developers of [Ping](https://www.getping.co/) 
- Feel free to file issues on Github!

