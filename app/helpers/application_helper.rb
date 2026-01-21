module ApplicationHelper
  def format_seconds(seconds)
    return "00:00:00" if seconds.nil?

    h = seconds / 3600
    m = (seconds % 3600) / 60
    s = seconds % 60

    format("%02d:%02d:%02d", h, m, s)
  end
end
