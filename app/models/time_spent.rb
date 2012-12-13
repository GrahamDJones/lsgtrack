class TimeSpent

  def initialize(num)
    @duration = num
  end

  def to_s
    hours = @duration/60
    minutes = @duration%60
    h_str = hours > 0 ? " #{hours.to_s} hour#{hours == 1 ? "" : "s"}" : ""
    m_str = minutes > 0 ? " #{minutes.to_s} minute#{minutes == 1 ? "" : "s"}" : " exactly"
    "Time spent:#{h_str}#{m_str}"
  end
end