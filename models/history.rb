class History

  attr_reader :history

  def initialize
    @history = []
  end

  def push_path(path)
    @history.push(path)
  end

  def get_previous_path
    @history[-2]
  end

  def clear_history
    @history = []
  end

  def remove_last_path
    @history.pop
  end

end