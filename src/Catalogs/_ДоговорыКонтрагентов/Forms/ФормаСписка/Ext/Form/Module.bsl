﻿
&НаКлиенте
Процедура бпсОткрытьОбработкуСтатусыСогласований() Экспорт

КонецПроцедуры //бпсОткрытьОбработкуСтатусыСогласований


&НаКлиенте
Процедура КомандаСтатусОбъектаБД(Команда)
	СтрокаСписок = Элементы.Список.ТекущиеДанные;	
	Если СтрокаСписок = Неопределено тогда
		Возврат;
	Конецесли;	
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ОбъектБД",СтрокаСписок.Ссылка);
	ОткрытьФорму("Обработка.бпсСтатусыСогласований.Форма.Форма",ПараметрыФормы,,СтрокаСписок.Ссылка);
КонецПроцедуры

