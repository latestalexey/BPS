﻿Функция Печать() Экспорт
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ОбъектБД",СсылкаНаОбъект);
	ОткрытьФорму("Обработка.бпсСтатусыСогласований.Форма.Форма",ПараметрыФормы,,Новый УникальныйИдентификатор());
КонецФункции