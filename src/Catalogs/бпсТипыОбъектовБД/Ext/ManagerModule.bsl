﻿Функция ПолучитьТипОбъектаБД(ОбъектБД) Экспорт 
	пТипОбъектаБД = Неопределено;
	ОбъектБДИмяМетаданных = ОбъектБД.Метаданные().Имя;	
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	бпсТипыОбъектовБД.Ссылка,
	|	бпсТипыОбъектовБД.ОбъектБДИмяМетаданных
	|ИЗ
	|	Справочник.бпсТипыОбъектовБД КАК бпсТипыОбъектовБД
	|ГДЕ
	|	бпсТипыОбъектовБД.ОбъектБДИмяМетаданных ПОДОБНО &ОбъектБДИмяМетаданных";
	
	Запрос.УстановитьПараметр("ОбъектБДИмяМетаданных", ОбъектБДИмяМетаданных);
	
	РезультатЗапроса = Запрос.Выполнить();
	Если НЕ РезультатЗапроса.Пустой() Тогда
		Выборка = РезультатЗапроса.Выбрать();
		Если Выборка.Количество() > 1 Тогда
			ВызватьИсключение "Ошибка! найдено более 1 типа объекта для ОбъектБДИмяМетаданных = ["+ОбъектБДИмяМетаданных+"]";
		Конецесли;
		Выборка.Следующий();
		пТипОбъектаБД = Выборка.Ссылка;
	КонецЕсли;	
	Возврат пТипОбъектаБД;	
КонецФункции //ПолучитьТипОбъекта(ОбъектБД)

Функция ЭтоСправочникИерархический(ЗНАЧ ТипОбъектаБД) Экспорт 
	пЭтоСправочникИерархический = Ложь;
	Если НЕ ЗначениеЗаполнено(ТипОбъектаБД) Тогда
		Возврат пЭтоСправочникИерархический;
	Конецесли;
	
	Если ТипОбъектаБД.МенеджерОбъекта <> "Справочники" Тогда
		Возврат пЭтоСправочникИерархический;
	Конецесли;
	
	пЭтоСправочникИерархический = Метаданные.Справочники[ТипОбъектаБД.ОбъектБДИмяМетаданных].Иерархический;
	
	Возврат пЭтоСправочникИерархический;
КонецФункции 