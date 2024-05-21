# Uttil Mobile

Repository for Uttil mobile app developed with Flutter.

## Project configurations
After a branch change or when updating your local repository, it may be necessary to resolve conflicts in the files, to do this follow the steps,
In the root folder of the project run:
```bash
make clean
make build
```
When there is an update in the app's translations, it will be necessary:
```bash
make localization
```
To activate the automatic code generator you can use:
```bash
make watch
```
## Commit Message Header

```bash
<type>(<scope>): <summary>
```

The `type` and `summary` fields are mandatory, the `scope` field is optional.

**Type**

Must be one of the following:

- `build`: Changes that affect the build system or external dependencies.
- `ci`: Change to out CI configuration field and scripts.
- `chore`: Maintain code.
- `docs`: Documentation only changes.
- `feat`: A new feature.
- `perf`: A code change that improves performance.
- `refactor`: A code changes that neither fixed a bug nor adds a feature.
- `test`: Adding missing tests or correcting existing tests.
- `style`: Fix a style, formatting, no code change.

**Scope**

The scope should be the name of module or scene, for example: `(feature-flag)`, (`item-add-scene)`

- `module-name`: When the work is in **models**, r**epositories** or **workers**.
- `scene-name`: When the work is in v**iew controllers**, **presenters**, **view models**, data **providers** or **custom views.**

**Summary**

Use the summary field to provide succinct description of the change.

- Use the imperative present tense: `change` not `changed` nor `changes`
- Don't capitalize the first letter
- No dot(.) at the end

## **Architecture**

**A brief look at the proposal**

You will separate the code into 4 layers: Core, Domain, Data, and Presentation.

- **Presentation:** UI components, basically everything that it’s a widget or a widget’s controller.
- **Domain:** Contains the core business entities and business logic. Above there are three main folders, use cases, repository (contract), and entities.
- **Data:** Support the Domain layer by adapting the data coming from the external layer through models, repositories (implementation), and services.
- **Core:** Contains shared logic such as configurations, utility classes, validators, etc.


## Table of contents

### Core

- Entities
- Configs
- Constants
- Extensions
- Utils
- Validators

### Data

- Repositories (implementation)
- Data sources
- Models
- Data Mappers
- Response DTOs
- Kinds
- Types

### Domain

- Repositories (contract)
- Use Cases
- Use Cases (implementation)

### Presentation

- Widgets
- Controllers

## Dart Style

### Goals

- Make it easier to read and begin understanding unfamiliar code.
- Make code easier to maintain.
- Reduce simple programmer errors.
- Keep discussions on diffs focused on the code's logic rather than its style.

### Table of contents

- Minimal Import
- Spacing

### 👉 Minimal Import

Only the modules necessary for the source file should be imported. All source files that must be imported from other files of the project must be done using relative paths. To import flutter-dart or external dependencies use the absolute path.

Try grouping imports this way, first source files and then environment and external dependencies, as well as by folders. 

🟢 **Preferred**

```dart
import '../../../core/utils/results.dart';
import '../../../data/data_sources/faq/faq_data_source.dart';
import '../../../data/repositories/faq/faq_repository_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
```

🔴 **Not Preferred**

```dart
import 'package:flutter/widgets.dart';
import 'package:uttil-app/data/data_sources/faq/faq_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:uttil-app/core/utils/results.dart';
import 'package:uttil-app/data/repositories/faq/faq_repository_impl.dart';
```

### 👉 Spacing

- The source code must be indented with 4 spaces.
- Method braces and other braces (`if` / `else` / `while`) always open on the same line as the statement but close on a new line.

🟢 **Preferred**

```dart
if (user.isEnable) {
    ...
} else {
    ...
}

```

🔴 **Not Preferred**

```dart
if (user.isEnable)
{
    ...
}
else 
{
    ...
}
```

- There should be a blank line between the type declaration to maintain a visual aid.
- Whitespace should be used in the methods to group functionalities.
- There should be no blank line after opening a brace or before closing a brace.
- Colons should not have a space on the left and should have a space on the right.
- Avoid trailing whitespaces at the ends of lines.