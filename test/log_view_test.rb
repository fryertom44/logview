require 'minitest/autorun'
require_relative '../log_view.rb'

class LogViewTest < Minitest::Test
  def test_throws_error_if_no_file
    assert_raises(ArgumentError) { LogView.new('./nonexistent_file.log') }
  end

  def test_set_lines
    logview = LogView.new('test.log')
    assert_equal logview.lines, ["/help_page/1 126.318.035.038", "/contact 184.123.665.067", "/home 184.123.665.067", "/about/2 444.701.448.104", "/help_page/1 929.398.951.889", "/index 444.701.448.104", "/help_page/1 722.247.931.582", "/about 061.945.150.735", "/help_page/1 646.865.545.408", "/home 235.313.352.950", "/contact 184.123.665.067", "/help_page/1 543.910.244.929", "/home 316.433.849.805"]
  end

  def test_set_pages
    logview = LogView.new('test.log')
    assert_equal logview.pages, ["/help_page/1", "/contact", "/home", "/about/2", "/help_page/1", "/index", "/help_page/1", "/about", "/help_page/1", "/home", "/contact", "/help_page/1", "/home"]
  end

  def test_set_addresses
    logview = LogView.new('test.log')
    assert_equal logview.addresses, ["126.318.035.038", "184.123.665.067", "184.123.665.067", "444.701.448.104", "929.398.951.889", "444.701.448.104", "722.247.931.582", "061.945.150.735", "646.865.545.408", "235.313.352.950", "184.123.665.067", "543.910.244.929", "316.433.849.805"]
  end
  
  def test_visit_results
    logview = LogView.new('test.log')
    assert_equal logview.visit_results, [["/help_page/1", 5], ["/home", 3], ["/contact", 2], ["/about/2", 1], ["/index", 1], ["/about", 1]]
  end

  def test_instance_print
    logview = LogView.new('test.log')
    assert_equal [
      "/help_page/1 has been visited 5 times",
      "/home has been visited 3 times",
      "/contact has been visited 2 times",
      "/about/2 has been visited 1 time",
      "/index has been visited 1 time",
      "/about has been visited 1 time"
    ], logview.print
  end

  def test_class_print
    assert_equal [
      "/help_page/1 has been visited 5 times",
      "/home has been visited 3 times",
      "/contact has been visited 2 times",
      "/about/2 has been visited 1 time",
      "/index has been visited 1 time",
      "/about has been visited 1 time"
    ], LogView.print('test.log')
  end
end
