﻿&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	УстановитьВидимостьДоступность();
КонецПроцедуры

&НаСервере
Процедура УстановитьВидимостьДоступность()
	ТолькоПросмотр = Истина;
	Элементы.ГруппаПользователиДляУведомления.Видимость = Ложь;
	Элементы.ГруппаДействия.Видимость = Ложь;

	РольДоступнабпсПолныеПрава = РольДоступна("бпсПолныеПрава");		
	Если Объект.Стартован
		ИЛИ Объект.Завершен Тогда
	Иначе
		ТолькоПросмотр = Ложь;
	Конецесли;
	
	Если РольДоступнабпсПолныеПрава Тогда
		Элементы.ГруппаПользователиДляУведомления.Видимость = Истина;
		Элементы.ГруппаДействия.Видимость = Истина;		
	Конецесли;
КонецПроцедуры //УстановитьВидимостьДоступность()
