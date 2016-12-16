# coding: utf-8
require 'rubygems'
require 'telegram/bot'
require 'SQLite3'
require_relative 'const.rb'
require_relative 'plug.rb'
db = SQLite3::Database.new 'users.db'

def check_user(id , db)
  db.results_as_hash = true
  db.execute("select * FROM users WHERE telegram_id ==?",id) do |row|
    if row["telegram_id"] = id
      return 1
    else return 0
    end

  end
end

def check_teacher(db,telegram_id,id)
  p id
  db.results_as_hash = true
  db.execute("select * FROM teachers WHERE id == ?",id.to_i) do |row|
    p row["id"]
    if row["id"] == id.to_i
      row["telegram_id"] = telegram_id
      return true
    end
  end
  return false
end
#def update_user(id, db,)
def new_user (id, db, who, facc, course)
      db.execute("INSERT INTO users (telegram_id, who_it, facc, course) VALUES ( ?,?,?,? )",id,who,facc,course)
end

token = '328699367:AAFddc1AQqeULvWzz5NL-seW7l1VoPc5AXo'
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|

    main_menu = Proc.new do |buttons,mess_text| 
      markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: false)
      bot.api.send_message(chat_id: message.chat.id,text: mess_text, reply_markup: markup,resize_keyboard:false)
    end
    
  case message.text 
    when 'Регистрация'
      main_menu.call @shedule, 'Кто вы?'
        when "Преподаватель"
          when bot.api.getUpdates()

          bot.api.send_message(chat_id:message.chat.id,text:'Введите свой индентификатор')
          if check_teacher(db,message.chat.id,message.text)
            bot.api.send_message(chat_id:message.chat.id,text:'Регистрация прошла успешно')
          else  
            bot.api.send_message(chat_id:message.chat.id,text:'Неверный идентификатор')
          end



        when 'Студент'
          db.execute("INSERT INTO users(who_it", 0)
          main_menu.call @student, 'Выберите курс'


  end


    case message.text

    when '/list'
      db.results_as_hash = true
      db.execute( "select * from users") do |row|
      bot.api.send_message(chat_id: message.chat.id,text: row["telegram_id"])
    end

    when '/start'
      if check_user(message.chat.id,db) == 1
        bot.api.send_message(chat_id: message.chat.id, text: "Профиль уже существует")
      else
        new_user(message.from.id,db,1.to_i,2.to_i,1.to_i)
        bot.api.send_message(chat_id: message.chat.id, text: "Профиль успешно создан")
    end
    when 'Главное меню'
      main_menu.call @main, 'Выберите пункт меню:'

    when "Получить расписание"
      main_menu.call @shedule, 'Выберите пункт меню:'

    when "Студент"
      main_menu.call @student, 'Выберите курс:'

    when "teacher_facc"
      main_menu.call @teacher_caff, 'Выберите кафедру:'
  end

    
#     when 'Расписание звонков'
#     	bot.api.send_photo(chat_id: message.chat.id, photo: 'pp.vk.me/c629212/v629212329/15654/VTScd-ZeSoo.jpg')
  	
#   	when 'Получить расписание'
# 		kb = [
# 			Telegram::Bot::Types::KeyboardButton.new(text: 'Выберите группу')
# 		]
# 		markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, one_time_keyboard: true)
#   		bot.api.send_message(chat_id: message.chat.id, text: '1', reply_markup: markup)
  	
#   	when 'Получить расписание'
# 		kb = [
# 			Telegram::Bot::Types::KeyboardButton.new(text: 'Выберите группу')
# 		]
# 		markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, one_time_keyboard: true)
# 	  	bot.api.send_message(chat_id: message.chat.id,text: '1', reply_markup: markup)
# 	end


  end
end

