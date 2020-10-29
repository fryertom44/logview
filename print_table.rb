class PrintTable

  # @param [Array] data column data e.g. [{ date: "2019-08-19", from: "Tom", subject: "Test" }]
  # @param [Hash] col_labels header column labels e.g. { date: "Date", from: "From", subject: "Subject" }
  #
  def initialize(data = [], col_labels = {})
    @data = data
    @columns = col_labels.each_with_object({}) do |(col,label), h|
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
    puts "| #{ @columns.map { | _k, v| v[:label].ljust(v[:width]) }.join(' | ') } |"
  end

  def write_divider
    puts "+-#{ @columns.map { | _k, v| "-"*v[:width] }.join("-+-") }-+"
  end

  def write_line(h)
    str = h.keys.map { |k| h[k].to_s.ljust(@columns[k][:width]) }.join(" | ")
    puts "| #{str} |"
  end
end