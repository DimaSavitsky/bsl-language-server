# GetForm method call (GetFormMethod)

| Type | Scope | Severity | Activated<br/>by default | Minutes<br/>to fix | Tags |
| :-: | :-: | :-: | :-: | :-: | :-: |
| `Error` | `BSL` | `Major` | `Yes` | `15` | `error` |

<!-- Блоки выше заполняются автоматически, не трогать -->
## Description
<!-- Описание диагностики заполняется вручную. Необходимо понятным языком описать смысл и схему работу -->
To open forms, use the OpenForm global context method (when using the 1C: Enterprise 8.2 platform version and earlier versions, also use OpenFormModal). 
An alternative method, using the GetForm method, is not recommended.
## Examples
<!-- В данном разделе приводятся примеры, на которые диагностика срабатывает, а также можно привести пример, как можно исправить ситуацию -->
```
Procedure Test()
    Doc = Documents.PlanOperation.CreateDocument();
    Form = Doc.GetForm("DocumentForm"); // here
EndProcedure
```
```
Procedure Test2()
    Form = GetForm("Document.PlanOperation.Form"); // here
EndProcedure
```
## Sources
<!-- Необходимо указывать ссылки на все источники, из которых почерпнута информация для создания диагностики -->
<!-- Примеры источников

* Источник: [Стандарт: Тексты модулей](https://its.1c.ru/db/v8std#content:456:hdoc)
* Полезная информаця: [Отказ от использования модальных окон](https://its.1c.ru/db/metod8dev#content:5272:hdoc)
* Источник: [Cognitive complexity, ver. 1.4](https://www.sonarsource.com/docs/CognitiveComplexity.pdf) -->
Source: [Standard](https://its.1c.ru/db/v8std/content/404/hdoc)

## Snippets

<!-- Блоки ниже заполняются автоматически, не трогать -->
### Diagnostic ignorance in code

```bsl
// BSLLS:GetFormMethod-off
// BSLLS:GetFormMethod-on
```

### Parameter for config

```json
"GetFormMethod": false
```
