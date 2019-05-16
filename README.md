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
    json_serializable - Serialize / Deserialize objects

## Instructions

### Setup
    - Flutter I18n Json: Update
      Generate I18n
    - flutter packages pub run build_runner build --delete-conflicting-outputs
      Generate .jorm (database) and .g (serializable) files 

### Jaguar ORM

    - Create model
    - Create bean
    - Generate .jorm file

### Json Serializable

    - Create model
    - Put annotations
    - Generate .g file

### vscode-flutter-i18n-json

    - Usings vscode-flutter-i18n-json plugin
    - Add strings to /i18n/*.json
    - Run command "Flutter I18n Json: Update"
    - Use generated class I18n
