require_relative './print_table'

class LogView
  attr_reader :lines, :pages, :addresses

  def initialize(path)
    raise ArgumentError.new("Log File '#{path}'' does not exist") unless File.exists?( path )

    @path = path
    parse_file
  end

  def visit_results
    pages.group_by(&:itself)
         .map { |k, v| { page: k, visits: v.size } }
         .sort { |a, b| b[:visits] <=> a[:visits] }
  end

  def unique_results
    lines.uniq.map { |l| l.split.first }
              .group_by(&:itself)
              .map { |k, v| { page: k, visits: v.size } }
              .sort { |a, b| b[:visits] <=> a[:visits] }
  end

  def average_results
    visit_results.map do |result|
      unique_result = unique_results.detect { |ur| ur[:page] == result[:page] }
      { page: result[:page], visits: result[:visits] / unique_result[:visits] }
    end
  end

  def print
    PrintTable.new(visit_results, {page: 'Page', visits: "Visits"}).call
    PrintTable.new(unique_results, {page: 'Page', visits: "Unique Visits"}).call
    PrintTable.new(average_results, {page: 'Page', visits: "Average Visits"}).call
  end

  def self.print(path_to_file)
    self.new(path_to_file).print
  end

  private

  def parse_file
    @lines = []
    @pages = []
    @addresses = []

    IO.foreach(@path, chomp: true) do |l|
      page, address = l.split
      @lines << l
      @pages << page
      @addresses << address
    end
  end
end

# run via command line (NOT in tests)
if __FILE__ == $0
  begin
    logview = LogView.new(*ARGV[0])
    logview.print
  rescue ArgumentError => e
    print "#{e}\n"
  end
end
