﻿Функция ПолучитьНастройкиДляСписка() Экспорт 
	ТекстЗапроса = Неопределено;
	ОсновнаяТаблица = Неопределено;
	
	РезультатФункции = Новый Структура();
	РезультатФункции.Вставить("ТекстЗапроса",ТекстЗапроса);
	РезультатФункции.Вставить("ОсновнаяТаблица",ОсновнаяТаблица);	
	
	Если НЕ ЗначениеЗаполнено(ТипОбъектаБД) Тогда
		Возврат РезультатФункции;
	Конецесли;
	
	пЭтоСправочникИерархический = Справочники.бпсТипыОбъектовБД.ЭтоСправочникИерархический(ТипОбъектаБД);
	
	ОсновнаяТаблица = ""+ТипОбъектаБД.МенеджерОбъектаДляЗапроса+"."+ТипОбъектаБД.ОбъектБДИмяМетаданных+"";
	
	ТекстЗапроса = ПолучитьТекстЗапроса(ОсновнаяТаблица,пЭтоСправочникИерархический);
	
	РезультатФункции.Вставить("ТекстЗапроса",ТекстЗапроса);
	РезультатФункции.Вставить("ОсновнаяТаблица",ОсновнаяТаблица);
	
	Возврат РезультатФункции;
КонецФункции //ПолучитьНастройкиДляСписка()

Функция ПолучитьТекстЗапроса(ОсновнаяТаблица,пЭтоСправочникИерархический) 
	ТекстЗапроса = "
	|ВЫБРАТЬ
	|	ОбъектыБД.Ссылка,
	|" 
	+ ?(пЭтоСправочникИерархический,"
	|	ВЫБОР КОГДА ОбъектыБД.Ссылка.ЭтоГруппа ТОГДА
	|		НЕОПРЕДЕЛЕНО
	|	ИНАЧЕ
	|   	ЕСТЬNULL(бпсСтатусыОбъектовСрезПоследних.Статус,ЗНАЧЕНИЕ(Справочник.бпсСтатусыОбъектов.Согласование_НеУтверждено))
	|	КОНЕЦ КАК Статус,"
	,"
	|	ЕСТЬNULL(бпсСтатусыОбъектовСрезПоследних.Статус,ЗНАЧЕНИЕ(Справочник.бпсСтатусыОбъектов.Согласование_НеУтверждено)) КАК Статус,"
	)+"
	|	бпсБизнесПроцессыСогласованияСрезПоследних.Согласование
	|ИЗ
	|	"+ОсновнаяТаблица+" КАК ОбъектыБД
	|		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.бпсСтатусыОбъектов.СрезПоследних(
	|				,
	|				ВЫБОР
	|					КОГДА &ПредметСогласованияЗаполнен
	|						ТОГДА ПредметСогласования = &ПредметСогласования
	|					ИНАЧЕ ИСТИНА
	|				КОНЕЦ) КАК бпсСтатусыОбъектовСрезПоследних
	|		ПО ОбъектыБД.Ссылка = бпсСтатусыОбъектовСрезПоследних.ОбъектБД
	|			И (&ПредметСогласованияЗаполнен)
	|		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.бпсБизнесПроцессыСогласования.СрезПоследних(
	|				,
	|				ВЫБОР
	|					КОГДА &ПредметСогласованияЗаполнен
	|						ТОГДА ПредметСогласования = &ПредметСогласования
	|					ИНАЧЕ ЛОЖЬ
	|				КОНЕЦ) КАК бпсБизнесПроцессыСогласованияСрезПоследних
	|		ПО ОбъектыБД.Ссылка = бпсБизнесПроцессыСогласованияСрезПоследних.ОбъектБД
	|			И (&ПредметСогласованияЗаполнен)
	|ГДЕ
	|	ИСТИНА
	|	И ВЫБОР КОГДА &ИспользоватьОтборПоОбъектуБД ТОГДА
	|		ОбъектыБД.Ссылка = &ОбъектБД	
	|	ИНАЧЕ
	| 		ИСТИНА
	|	КОНЕЦ
	|";
	Возврат ТекстЗапроса;
КонецФункции //ПолучитьТекстЗапроса()
	