require 'minitest/autorun'
require_relative '../print_table.rb'

class PrintTableTest < Minitest::Test
  def test_output_table
    pt = PrintTable.new(data, column_headers)
    assert_output(
      <<~HEREDOC
      +----------+----------+----------+
      | Column 1 | Column 2 | Column 3 |
      +----------+----------+----------+
      | value a  | value b  | value c  |
      | value d  | value e  | value f  |
      | value g  | value h  | value i  |
      +----------+----------+----------+
      HEREDOC
    ) { pt.call }
  end

  def data
    [
      { column_1: 'value a', column_2: 'value b', column_3: 'value c'},
      { column_1: 'value d', column_2: 'value e', column_3: 'value f'},
      { column_1: 'value g', column_2: 'value h', column_3: 'value i'},
    ]
  end

  def column_headers
    { column_1: 'Column 1', column_2: 'Column 2', column_3: 'Column 3'}
  end
end