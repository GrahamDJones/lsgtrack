class TimeSpent

  def initialize(value)
    @duration = value
  end

  def to_s
    hours = @duration/60
    minutes = @duration%60
    h_str = hours > 0 ? " #{hours.to_s} hour#{hours == 1 ? "" : "s"}" : ""
    m_str = minutes > 0 ? " #{minutes.to_s} minute#{minutes == 1 ? "" : "s"}" : " exactly"
    "Time spent:#{h_str}#{m_str}"
  end

  def to_i
    if @duration.include?(':')
      a = @duration.split(':')
      a[0].to_i * 60 + a[1].to_i
    elsif @duration.include?('.')
      (@duration.to_f * 60).to_i
    else
      @duration.to_i
    end unless @duration.blank?
  end

end