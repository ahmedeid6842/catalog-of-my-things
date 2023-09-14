require_relative 'app'
require './lib/controllers/menu_controller'

def main
  app = App.new
  menu = Menu.new(app)
  menu.display_menu
end

main
