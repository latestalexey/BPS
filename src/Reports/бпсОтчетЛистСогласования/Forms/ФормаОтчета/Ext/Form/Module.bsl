﻿
&НаСервере
Процедура КомандаСвернутьГруппировкиНаСервере()
 	Результат.ЗакончитьАвтогруппировкуСтрок();
	КолвоГруппировок = Результат.КоличествоУровнейГруппировокСтрок();
	НомерГруппировки = КолвоГруппировок-1;
	Пока НомерГруппировки >=0 Цикл
		Результат.ПоказатьУровеньГруппировокСтрок(НомерГруппировки);
		НомерГруппировки=НомерГруппировки-1;
	Конеццикла;
	
	КолвоГруппировок = Результат.КоличествоУровнейГруппировокКолонок();
	НомерГруппировки = КолвоГруппировок-1;
	Пока НомерГруппировки >=0 Цикл
		Результат.ПоказатьУровеньГруппировокКолонок(НомерГруппировки);
		НомерГруппировки=НомерГруппировки-1;
	Конеццикла;
КонецПроцедуры

&НаКлиенте
Процедура КомандаСвернутьГруппировки(Команда)
	КомандаСвернутьГруппировкиНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	УстановитьВидимостьДоступность();
КонецПроцедуры

&НаСервере
Процедура УстановитьВидимостьДоступность()
	//НастройкиКД = КомпоновщикНастроек.ПолучитьНастройки();
	//ПараметрБизнесПроцесс = НастройкиКД.ПараметрыДанных.НайтиЗначениеПараметра(Новый ПараметрКомпоновкиДанных("БизнесПроцесс"));
	//ПараметрИспользоватьОтборПоБизнесПроцессу = НастройкиКД.ПараметрыДанных.НайтиЗначениеПараметра(Новый ПараметрКомпоновкиДанных("ИспользоватьОтборПоБизнесПроцессу"));
	//
	//Если ПараметрБизнесПроцесс.Использование Тогда
	//	БизнесПроцесс = ПараметрБизнесПроцесс.Значение;
	//Конецесли;	
КонецПроцедуры 