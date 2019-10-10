Процедура ТестВопрос()
    Режим = РежимДиалогаВопрос.ДаНет;
    Ответ = Вопрос(НСтр("ru = 'Продолжить выполнение операции?';"
         + " en = 'Do you want to continue?'"), Режим, 0);
    Если Ответ = КодВозвратаДиалога.Нет Тогда
        Возврат;
    КонецЕсли;

    ///////////////////////////////////////////////////////////////////

    Режим = РежимДиалогаВопрос.ДаНет;
    Оповещение = Новый ОписаниеОповещения("ПослеЗакрытияВопроса", ЭтаФорма, Параметры);
    ПоказатьВопрос(Оповещение, НСтр("ru = 'Продолжить выполнение операции?';"
        + " en = 'Do you want to continue?'"), Режим, 0);

    Если Результат = КодВозвратаДиалога.Нет Тогда
        Возврат;
    КонецЕсли;
КонецПроцедуры

Процедура ТестПредупреждение()
    Предупреждение(НСтр("ru = 'Выберите документ!'; en = 'Select a document!'"), 10);
    ///////////////////////////////////////////////////////////////////
    ПоказатьПредупреждение(,НСтр("ru = 'Выберите документ!'; en = 'Select a document!'"), 10);
КонецПроцедуры

Процедура ТестОткрытьЗначение()

    Товар = Справочники.Номенклатура.НайтиПоКоду(КодТовара);
    ОткрытьЗначение(Товар);

    ///////////////////////////////////////////////////////////////////

    Товар = Справочники.Номенклатура.НайтиПоКоду(КодТовара);
    ПоказатьЗначение(,Товар);

КонецПроцедуры

Процедура ТестВвестиДату()

    ДатаНапоминания = РабочаяДата;
    Подсказка = "Введите дату и время";
    ЧастьДаты = ЧастиДаты.ДатаВремя;
    Если ВвестиДату(ДатаНапоминания, Подсказка, ЧастьДаты) Тогда
        // запомнить дату напоминания
    КонецЕсли;

    ///////////////////////////////////////////////////////////////////

    ДатаНапоминания = РабочаяДата;
    Подсказка = "Введите дату и время";
    ЧастьДаты = ЧастиДаты.ДатаВремя;
    Оповещение = Новый ОписаниеОповещения("ПослеВводаДаты", , Параметры);
    ПоказатьВводДаты(Оповещение, ДатаНапоминания, Подсказка, ЧастьДаты);

    Если НЕ Дата = Неопределено Тогда
        // запомнить дату напоминания
    КонецЕсли;

КонецПроцедуры

Процедура ТестВвестиЗначение()

    Перем ВыбЗнач;
    Массив = Новый Массив;
    Массив.Добавить(Тип("Число"));
    Массив.Добавить(Тип("Строка"));
    Массив.Добавить(Тип("Дата"));
    КЧ = Новый КвалификаторыЧисла(12,2);
    КС = Новый КвалификаторыСтроки(20);
    КД = Новый КвалификаторыДаты(ЧастиДаты.Дата);
    ОписаниеТипов = Новый ОписаниеТипов(Массив, КЧ, КС, КД);
    Если ВвестиЗначение(ВыбЗнач, "Введите значение", ОписаниеТипов) Тогда
        Сообщить("Введенное значение: "+ВыбЗнач);
    КонецЕсли;

    ///////////////////////////////////////////////////////////////////

    ВыбЗнач = Неопределено;
    Массив = Новый Массив;
    Массив.Добавить(Тип("Число"));
    Массив.Добавить(Тип("Строка"));
    Массив.Добавить(Тип("Дата"));
    КЧ = Новый КвалификаторыЧисла(12,2);
    КС = Новый КвалификаторыСтроки(20);
    КД = Новый КвалификаторыДаты(ЧастиДаты.Дата);
    ОписаниеТипов = Новый ОписаниеТипов(Массив, КЧ, КС, КД);
    Оповещение =
        Новый ОписаниеОповещения("ПослеВводаЗначения", ЭтотОбъект);
    ПоказатьВводЗначения(Оповещение,
        ВыбЗнач, "Введите значение", ОписаниеТипов);

    Если ВыбЗнач<>Неопределено Тогда
        // обработка введенного значения
        Сообщить("Введенное значение: " + ВыбЗнач);
    КонецЕсли;

КонецПроцедуры

Процедура ТестВвестиСтроку()

    Текст = "";
    Подсказка = "Введите текст напоминания";
    Если ВвестиСтроку(Текст, Подсказка, 0, Истина) Тогда
        // запомнить текст напоминания
    КонецЕсли;

    ///////////////////////////////////////////////////////////////////

    Подсказка = "Введите текст напоминания";
    Оповещение = Новый ОписаниеОповещения("ПослеВводаСтроки", , Параметры);
    ПоказатьВводСтроки(Оповещение, "", Подсказка, 0, Истина);

    Если НЕ Строка = Неопределено Тогда
        // запомнить текст напоминания
    КонецЕсли;

КонецПроцедуры

Процедура ТестВвестиЧисло()

    Количество = 1;
    Если ВвестиЧисло(Количество, "Введите количество", 10, 2) Тогда
        // обработка введенного количества
    КонецЕсли;

    ///////////////////////////////////////////////////////////////////

    Оповещение = Новый ОписаниеОповещения("ПослеВводаКоличества", ЭтотОбъект);
    ПоказатьВводЧисла(Оповещение, 1, "Введите количество", 10, 2);

    Если НЕ Число = Неопределено Тогда
        // обработка введенного количества
    КонецЕсли;
КонецПроцедуры

Процедура ТестУстановитьВнешнююКомпоненту()

    УстановитьВнешнююКомпоненту("ПутьККомпоненте");

    ///////////////////////////////////////////////////////////////////

    НачатьУстановкуВнешнейКомпоненты(ОписаниеОповещения, "ОбщийМакет.КомпонентаВырезанияКартинки");

КонецПроцедуры

Процедура ТестОткрытьФормуМодально()

    ОткрытьФормуМодально("Форма");

    ///////////////////////////////////////////////////////////////////

    ОткрытьФорму(Форма);

КонецПроцедуры

Процедура ТестУстановитьРасширениеРаботыСФайлами()

    #Если ВебКлиент Тогда
        Результат = УстановитьРасширениеРаботыСФайлами();
    #КонецЕсли

    ///////////////////////////////////////////////////////////////////

    Оповещение = Новый ОписаниеОповещения("НачатьПодключениеРасширенияРаботыСФайламиЗавершение", ЭтотОбъект);
    НачатьПодключениеРасширенияРаботыСФайлами(Оповещение);

КонецПроцедуры

Процедура ТестУстановитьРасширениеРаботыСКриптографией()

    #Если ВебКлиент Тогда
        Результат = УстановитьРасширениеРаботыСКриптографией();
    #КонецЕсли

    ///////////////////////////////////////////////////////////////////

    Оповещение = Новый ОписаниеОповещения("НачатьУстановкуРасширенияРаботыСКриптографиейЗавершение", ЭтотОбъект);
    НачатьУстановкуРасширенияРаботыСКриптографией(Оповещение);

КонецПроцедуры

Процедура ТестПодключитьРасширениеРаботыСКриптографией()

    Если НЕ ПодключитьРасширениеРаботыСКриптографией() Тогда
        Предупреждение(НСтр("ru='Для выполнения команды ""Подписать"" вам нужно установить расширение работы с криптографией.'"));
        Возврат;
    КонецЕсли;

    ///////////////////////////////////////////////////////////////////

    Оповещение = Новый ОписаниеОповещения("РасширениеПодключено", ЭтотОбъект);
    НачатьПодключениеРасширенияРаботыСКриптографией(Оповещение);

КонецПроцедуры

Процедура ТестПодключитьРасширениеРаботыСФайлами()

    Если НЕ ПодключитьРасширениеРаботыСФайлами() Тогда
        Предупреждение(НСтр("ru='Для выполнения команды вам нужно установить расширение работы с файлами.'"));
        Возврат;
    КонецЕсли;

    ///////////////////////////////////////////////////////////////////

    Оповещение = Новый ОписаниеОповещения("РасширениеПодключено", ЭтотОбъект);
    НачатьПодключениеРасширенияРаботыСФайлами(Оповещение);

КонецПроцедуры

Процедура ТестПоместитьФайл()

    Перем АдресХранилища;

    ПоместитьФайл(АдресХранилища, ПутьКФайлу, ПутьКФайлу, Ложь, УникальныйИдентификатор);

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("ВыполнитьПосле", ЭтотОбъект,мШиринаКолонокПоУмолчанию);
    НачатьПомещениеФайла(ОписаниеОповещения, АдресХранилища, ПутьКФайлу, Ложь, УникальныйИдентификатор);

КонецПроцедуры

Процедура ТестКопироватьФайл()

    КопироватьФайл("C:\Temp\Order.htm", "C:\My Documents\Order.htm");

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("ПослеКопирования");
    НачатьКопированиеФайла(ОписаниеОповещения, "C:\Temp\Order.htm", "C:\My Documents\Order.htm");

КонецПроцедуры

Процедура ТестПереместитьФайл()

    ПереместитьФайл("C:\Temp\Order.htm", "C:\My Documents\Order.htm");

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("ПослеПеремещения");
    НачатьПеремещениеФайла(ОписаниеОповещения, "C:\Temp\Order.htm", "C:\My Documents\Order.htm");

КонецПроцедуры

Процедура ТестНайтиФайлы()

    НайденныеФайлы = НайтиФайлы("C:\Temp", "*.cdx");

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("ПослеПоиска");
    НачатьПоискФайлов(Оповещение, "C:\Temp", "*.cdx");

КонецПроцедуры

Процедура ТестУдалитьФайлы()

    // Удаление каталога и всех вложенных в него каталогов и файлов
    Попытка
        УдалитьФайлы("C:\temp\Works");
    Исключение
        Сообщить(ОписаниеОшибки());
    КонецПопытки;

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("ПослеУдаления");
    НачатьУдалениеФайлов(Оповещение, "C:\temp\Works");

КонецПроцедуры

Процедура ТестСоздатьКаталог()

    СоздатьКаталог("C:\Temp");

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("ПослеСоздания");
    НачатьСозданиеКаталога(Оповещение, "C:\Temp");

КонецПроцедуры

Процедура ТестКаталогВременныхФайлов()

    ГдеИскать = КаталогВременныхФайлов();

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("После");
    НачатьПолучениеКаталогаВременныхФайлов(Оповещение);

КонецПроцедуры

Процедура ТестКаталогДокументов()

    ГдеИскать = КаталогДокументов();

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("После");
    НачатьПолучениеКаталогаДокументов(Оповещение);

КонецПроцедуры

Процедура ТестРабочийКаталогДанныхПользователя()

    ГдеИскать = РабочийКаталогДанныхПользователя();

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("После");
    НачатьПолучениеРабочегоКаталогаДанныхПользователя(Оповещение);

КонецПроцедуры

Процедура ТестПолучитьФайлы()

    Результат = ПолучитьФайлы(МассивФайлов, ПолученныеФайлы, ПутьВыгружаемыхФайлов, Ложь);
    Если НЕ Результат Тогда
        Сообщение = Новый СообщениеПользователю;
        Сообщение.Текст = "Ошибка получения файлов!";
        Сообщение.Сообщить();
    КонецЕсли;

    ///////////////////////////////////////////////////////////////////

    Адрес        = ПоместитьВоВременноеХранилище(Неопределено, УникальныйИдентификатор);
    ИмяФайла    = "";

    ПолучитьДанныеФайлаНаСервереБезКонтекста(Адрес, ИмяФайла);

    ПолноеИмяФайла = ИмяКаталогаДокументов + ИмяФайла;

    МассивПолучаемыхФайлов = Новый Массив;
    МассивПолучаемыхФайлов.Добавить(Новый ОписаниеПередаваемогоФайла(ПолноеИмяФайла, Адрес));

    НачатьПолучениеФайлов(Новый ОписаниеОповещения("ОткрытьФайлЗавершение", ЭтотОбъект), МассивПолучаемыхФайлов,, Ложь);

КонецПроцедуры

Процедура ТестПоместитьФайлы()

    МассивВнутреннихАдресовСервера = Новый Массив;
    Результат = ПоместитьФайлы(, МассивВнутреннихАдресовСервера);

    ///////////////////////////////////////////////////////////////////

    ОписаниеОповещения = Новый ОписаниеОповещения("ОбработатьВыборФайла", ЭтаФорма);
    ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
    ДиалогОткрытияФайла.МножественныйВыбор = Ложь;

    НачатьПомещениеФайлов(ОписаниеОповещения, , ДиалогОткрытияФайла, Истина, УникальныйИдентификатор);

КонецПроцедуры

Процедура ТестЗапроситьРазрешениеПользователя()

    ОписаниеВызова = Новый Массив;
    ОписаниеВызова.Добавить("ПоместитьФайлы");
    ПомещаемыеФайлы = Новый Массив;
    Описание = Новый ОписаниеПередаваемогоФайла(СтрокаСписка, "");
    ПомещаемыеФайлы.Добавить(Описание);
    ОписаниеВызова.Добавить(ПомещаемыеФайлы);
    ОписаниеВызова.Добавить(Неопределено); // не используется
    ОписаниеВызова.Добавить(Неопределено); // не используется
    ОписаниеВызова.Добавить(Ложь);            // Интерактивно = Ложь
    МассивОпераций.Добавить(ОписаниеВызова);
    Если НЕ ЗапроситьРазрешениеПользователя(МассивОпераций) Тогда
        // пользователь не дал разрешения
        Возврат;
    КонецЕсли;

    ///////////////////////////////////////////////////////////////////

    Вызовы = Новый Массив;
    Вызов = Новый Массив;
    Вызов.Добавить("НачатьПолучениеФайлов");
    Вызов.Добавить(ПолучаемыеФайлы);
    Вызов.Добавить(ПутьКФайлам);
    Вызов.Добавить(Ложь);
    Вызовы.Добавить(Вызов);

    ОбработкаПродолжения = Новый ОписаниеОповещения("СохранитьДанныеВместеСПодписью", ЭтотОбъект, ДопПараметры);
    НачатьЗапросРазрешенияПользователя(ОбработкаПродолжения, Вызовы);

КонецПроцедуры

Процедура ТестЗапуститьПриложение()

    // открытие файла MS Excel
    ЗапуститьПриложение("Таблица.xls");

    ///////////////////////////////////////////////////////////////////

    Оповещение = Новый ОписаниеОповещения("ЗапускПриложения");
    НачатьЗапускПриложения(Оповещение, "Таблица.xls", , Истина);

КонецПроцедуры
