# Sonar Analysis

[![Pub Version](https://img.shields.io/pub/v/sonar_analysis.svg)](https://pub.dev/packages/sonar_analysis)
[![Publisher](https://img.shields.io/pub/publisher/sonar_analysis.svg)](https://pub.dev/packages/sonar_analysis/publisher)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

**Strict, opinionated, and production-ready lint rules for Dart and Flutter projects, based on SonarQube recommendations.**

This package provides a comprehensive set of linting rules to help you identify bugs, vulnerabilities, and code smells early in the development lifecycle. It aggregates the best practices from SonarSource adapted for the Dart ecosystem.

## 📦 Installation

You can install this package as a development dependency.

### Flutter

```bash
flutter pub add dev:sonar_analysis
```

### Dart

```bash
dart pub add dev:sonar_analysis
```

## 🚀 Usage

To enable the rules, add the following to your `analysis_options.yaml` file:

```yaml
include: package:sonar_analysis/sonar_analysis.yaml
```

This will automatically activate the linter rules.

## 🛠 Customization

You can customize the analysis options to fit your project's needs. For example, you can exclude specific files or override specific rules.

```yaml
include: package:sonar_analysis/sonar_analysis.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
  errors:
    invalid_annotation_target: ignore

linter:
  rules:
    # Disable specific rules if needed
    avoid_print: false
```

## 🛡 Badge

Show the world that your code is analyzed with Sonar rules by adding this badge to your README:

```markdown
[![Style: sonar_analysis](https://img.shields.io/badge/style-sonar__analysis-40c4ff.svg)](https://pub.dev/packages/sonar_analysis)
```

## 🤝 Contributing

Contributions are welcome! If you find a bug or want to suggest a new rule, please open an issue or submit a pull request on [GitHub](https://github.com/4rthurmonteiro/sonar_analysis).

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.