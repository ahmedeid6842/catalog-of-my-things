require_relative "app"

def main
  app = App.new
  menu = Menu.new(app)
  menu.display_menu
end

main
