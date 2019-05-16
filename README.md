# myFinance Flutter

## File structure

    bloc
      feature
    data_source
      database
      api
    repository
    ui
      page
      widget

## Dependencies

    bloc - Bloc streams
    flutter_bloc - Bloc widgets
    graphql_flutter - Client for GraphQL
    jaguar_orm - ORM for Sqflite

## Instructions

#### Jaguar ORM

    - Create model
    - Create bean
    - Generate .jorm file
    - Command: "flutter packages pub run build_runner build"

#### vscode-flutter-i18n-json

    - Usings vscode-flutter-i18n-json plugin
    - Add strings to /i18n/*.json
    - Run command "Flutter I18n Json: Update"
    - Use generated class I18n
