module Screen
  def self.get_input(view)
    self.render_view(view)
    return gets.chomp
  end

  def self.render_view(view)
    print(view)
  end

  def self.clear
    system("clear") || system("cls")
  end

  def self.clear_and_render(view)
    self.clear
    self.render_view(view)
  end
end
