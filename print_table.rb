class PrintTable

  # Accepts header column labels in the following format:
  # => { date: "Date", from: "From", subject: "Subject" }
  #
  # Accepts data in the following format:
  # => [{ date: "2019-08-19", from: "Tom", subject: "Test" }]
  #
  def initialize(data = [], col_labels = {})
    # Create the following data:
    # => {:date=>    {:label=>"Date",    :width=>10},
    #     :from=>    {:label=>"From",    :width=>7},
    #     :subject=> {:label=>"Subject", :width=>22}}
    @data = data
    @columns = col_labels.each_with_object({}) do |(col,label),h|
      h[col] = {
        label: label,
        width: [data.map { |g| g[col].size }.max, label.size].max
      }
    end
  end

  def call
    write_divider
    write_header
    write_divider
    @data.each { |col| write_line(col) }
    write_divider
  end

  private

  def write_header
    puts "| #{ @columns.map { |_,g| g[:label].ljust(g[:width]) }.join(' | ') } |"
  end

  def write_divider
    puts "+-#{ @columns.map { |_,g| "-"*g[:width] }.join("-+-") }-+"
  end

  def write_line(h)
    str = h.keys.map { |k| h[k].to_s.ljust(@columns[k][:width]) }.join(" | ")
    puts "| #{str} |"
  end
end