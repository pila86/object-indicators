﻿
#language: ru

@tree

Функциональность: Показатели объектов со способом расчета "Выполнить код"

Я хочу иметь возможность создавать показатели со способом расчета "Выполнить код"

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	
Сценарий: Расчет показателя с типом расчета "Выполнить код"
	Дано Я проверяю отсутствие показателя с кодом "ТестВыполнитьКод"
	И Я создаю показатель "Тест Выполнить код"
		И Я открываю навигационную ссылку "e1cib/list/ПланВидовХарактеристик.ПоказателиОбъектов"
		И Я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Показатели объектов (создание)'
		И в поле 'Наименование' я ввожу текст "Тест Выполнить код"
		И я нажимаю кнопку выбора у поля с именем "Владелец"
		Тогда открылось окно 'Объекты метаданных ПО'
		И в таблице "Список" я перехожу к строке:
			| 'Представление' |
			| 'Справочники'   |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Список" я перехожу к строке:
			| 'Представление'                |
			| 'Демо поставщики (Справочник)' |
		И в таблице "Список" я выбираю текущую строку
		И я меняю значение переключателя 'Способ расчета' на 'Выполнить код'
		И я перехожу к закладке "Страница выполнить код"
		И в поле 'ВыполняемыйКод' я ввожу текст 
			|'Для Каждого ТекущийОбъект Из МассивОбъектов Цикл'|
			|' Результат.Вставить(ТекущийОбъект, "тест");'|
			|'КонецЦикла;'|
		И я перехожу к закладке "Запуск расчета (что является инициатором запуска расчета)"
		И я устанавливаю флаг 'Запускать по триггерам'
		И в таблице "Триггеры" я нажимаю на кнопку с именем 'ТриггерыДобавить'
		И в таблице "Триггеры" я нажимаю кнопку выбора у реквизита "Объект метаданных"
		Тогда открылось окно 'Объекты метаданных ПО'
		И в таблице "Список" я перехожу к строке:
			| 'Представление' |
			| 'Справочники'   |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Список" я перехожу к строке:
			| 'Представление' |
			| 'Демо Поставщики (Справочник)' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Показатели объектов (создание) *'
		И в таблице "Триггеры" я активизирую поле "Ключ"
		И в таблице "Триггеры" я нажимаю кнопку выбора у реквизита "Ключ"
		Тогда открылось окно 'Свойства объектов метаданных ПО'
		И в таблице "Список" я перехожу к строке:
			| 'Имя'    |
			| 'Ссылка' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Показатели объектов (создание) *'
		И в таблице "Триггеры" я завершаю редактирование строки
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Показатели объектов (создание) *' в течение 2 секунд

	И Я выполняю запись первого попавшегося поставщика
		И Я открываю основную форму списка справочника "ДемоПоставщики"
		Тогда открылось окно "Демо поставщики"
		Если в таблице "Список" количество строк "меньше или равно" 0 Тогда
			Тогда Я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно 'Демо поставщики (создание)'
			И в поле 'Наименование' я ввожу текст 'Тестовый поставщик'
			И Я нажимаю на кнопку "Записать и закрыть"
		И в таблице "Список" я перехожу к первой строке
		И в таблице "Список" я выбираю текущую строку
		И я жду открытия окна отличного от "Демо поставщики" в течение 2 секунд
		И Я нажимаю на кнопку "Записать"
		И В текущем окне я нажимаю кнопку командного интерфейса 'Значения показателей объектов'
		И Я устанавливаю фильтр на список
   	    		| Показатель| Равно| Тест Выполнить код |
		И в таблице "Список" 1 строк, у которых колонка "Значение показателя" "Равно" "тест"
		И Я закрываю текущее окно

	И Я удаляю показатель 
		И Я открываю навигационную ссылку "e1cib/list/ПланВидовХарактеристик.ПоказателиОбъектов"
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Тест Выполнить код' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Тест Выполнить код (Показатели объектов)'
		И в поле 'Наименование' я ввожу текст 'УдалитьТест Выполнить код'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку 'Пометить на удаление / Снять пометку'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Да'
		И Я закрываю текущее окно
		И Я удаляю показатель с кодом "УдалитьТестВыполнитьКод"
		И Я закрываю текущее окно
		