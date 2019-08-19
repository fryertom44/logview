
class LogView
  PAGE_REGEX = /^\S*/
  IP_REGEX = /\S*$/

  attr_reader :lines, :pages, :addresses

  def initialize(path)
    raise ArgumentError unless File.exists?( path )

    @path = path
    parse_file
  end

  def visit_results
    pages.group_by(&:itself)
         .map { |k, v| [k, v.size] }
         .sort { |a, b| b[1] <=> a[1] }
  end

  def unique_results
    lines.uniq.map { |l| l.match(PAGE_REGEX).to_s }
              .group_by(&:itself)
              .map { |k, v| [k, v.size] }
              .sort { |a, b| b[1] <=> a[1] }
  end

  def print
    res1 = visit_results.map do |visit|
      p "#{visit[0]} has been visited #{visit[1]} #{visit[1] > 1 ? 'times' : 'time'}"
    end
    res2 = unique_results.map do |visit|
      p "#{visit[0]} has had #{visit[1]} unique #{visit[1] > 1 ? 'visits' : 'visit'}"
    end
    [res1, res2]
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
      @lines << l
      @pages << l.match(PAGE_REGEX).to_s
      @addresses << l.match(IP_REGEX).to_s
    end
  end
end

# run via command line (NOT in tests)
if __FILE__ == $0
  logview = LogView.new(*ARGV[0])
  logview.print
end
