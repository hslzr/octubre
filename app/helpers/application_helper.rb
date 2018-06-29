module ApplicationHelper
  def full_name
    "#{current_user.name} #{current_user.last_name}"
  end

  def time_greeting
    greet = "Buen"
    case Time.now.hour
    when 0..4
      greet += "as noches"
    when 5..11
      greet += "os días"
    when 12..20
      greet += "as tardes"
    when 21..23
      greet += "as noches"
    end
    greet
  end
end
