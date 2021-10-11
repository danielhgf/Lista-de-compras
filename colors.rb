aclass String
  def black
    "\033[1;30m#{self}\033[0;0m"
  end

  def red
    "\033[1;31m#{self}\033[0;0m"
  end

  def green
    "\033[1;32m#{self}\033[0;0m"
  end

  def yellow
    "\033[1;33m#{self}\033[0;0m"
  end

  def blue
    "\033[1;34m#{self}\033[0;0m"
  end

  def magenta
    "\033[1;35m#{self}\033[0;0m"
  end

  def cyan
    "\033[1;36m#{self}\033[0;0m"
  end

  def light_gray
    "\033[1;37m#{self}\033[0;0m"
  end

  def dark_grey
    "\033[1;90m#{self}\033[0;0m"
  end

  def light_red
    "\033[1;91m#{self}\033[0;0m"
  end

  def light_green
    "\033[1;92m#{self}\033[0;0m"
  end

  def light_yellow
    "\033[1;93m#{self}\033[0;0m"
  end

  def light_blue
    "\033[1;94m#{self}\033[0;0m"
  end

  def light_magenta
    "\033[1;95m#{self}\033[0;0m"
  end

  def light_cyan
    "\033[1;96m#{self}\033[0;0m"
  end

  def white
    "\033[1;97m#{self}\033[0;0m"
  end

  def bold
    "\033[;1m#{self}\033[0;0m"
  end

  def invets
    "\033[;7m#{self}\033[0;0m"
  end

  def reset
    "\033[0;0m#{self}\033[0;0m"
  end
end
