require './lib/controllers/menu_controller'

class App
  def initialize
    @menu = Menu.new(self)
  end

  def start
    @menu.display_menu
  end

  def exit
    save_data
    puts 'Bye!'
  end
end
