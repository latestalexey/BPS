﻿
&НаКлиенте
Процедура КомандаСтатусОбъектаБД(Команда)
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ОбъектБД",Объект.Ссылка);
	ОткрытьФорму("Обработка.бпсСтатусыСогласований.Форма.Форма",ПараметрыФормы);
КонецПроцедуры
