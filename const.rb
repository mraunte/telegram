require 'telegram/bot'
@main = [
        Telegram::Bot::Types::KeyboardButton.new(text: 'Регистрация'),
        Telegram::Bot::Types::KeyboardButton.new(text: 'Расписание'),
        Telegram::Bot::Types::KeyboardButton.new(text: 'Расписание звонков'),
        Telegram::Bot::Types::KeyboardButton.new(text: 'Расписание других групп'),
        Telegram::Bot::Types::KeyboardButton.new(text: 'Обратная связь'),
]
@shedule = [
        Telegram::Bot::Types::KeyboardButton.new(text: 'Преподаватель'),
        Telegram::Bot::Types::KeyboardButton.new(text: 'Студент'),
        Telegram::Bot::Types::KeyboardButton.new(text: 'Главное меню'),

]
@student = [
	Telegram::Bot::Types::KeyboardButton.new(text: '1 курс'),
	Telegram::Bot::Types::KeyboardButton.new(text: '2 курс'),
	Telegram::Bot::Types::KeyboardButton.new(text: '3 курс'),
	Telegram::Bot::Types::KeyboardButton.new(text: '4 курс'),
	Telegram::Bot::Types::KeyboardButton.new(text: '5 курс'),
	Telegram::Bot::Types::KeyboardButton.new(text: '6 курс'),
	Telegram::Bot::Types::KeyboardButton.new(text: 'Главное меню'),

]
@teacher = [
	Telegram::Bot::Types::KeyboardButton.new(text: 'ФМИАТ'),
	Telegram::Bot::Types::KeyboardButton.new(text: 'ФМИАТ'),
	Telegram::Bot::Types::KeyboardButton.new(text: 'Главное меню'),

]

@teacher_caff = [
	Telegram::Bot::Types::KeyboardButton.new(text: 'ФМИАТ'),
	Telegram::Bot::Types::KeyboardButton.new(text: 'ФМИАТ'),
	Telegram::Bot::Types::KeyboardButton.new(text: 'ФМИАТ'),
	Telegram::Bot::Types::KeyboardButton.new(text: 'ФМИАТ'),
	Telegram::Bot::Types::KeyboardButton.new(text: 'Главное меню'),

]
