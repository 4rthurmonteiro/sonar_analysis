# Sonar Dart lint rules

The Dart linter is a static analyzer for identifying possible problems in your
Dart source code. More than a hundred [linter rules][rules] are available,
checking anything from potential typing issues, coding style, and formatting.
This package - `package:sonar_analysis` - contains the lint settings recommended by the
[Sonar][sonar].

## Enabling the lints

For existing apps or packages, you can enable these lints via:

1.  In a terminal, located at the root of your package, run this command:

    ```terminal
    dart pub add dev:sonar_analysis
    ```

2.  Create a new `analysis_options.yaml` file, next to the pubspec, that
    includes the lints package:

    ```yaml
    include: package:sonar_analysis/sonar_analysis.yaml
    ```


[rules]: https://dart.dev/tools/linter-rules
[sonar]: https://rules.sonarsource.com/dart/