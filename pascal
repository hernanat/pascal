#!/usr/bin/ruby

require 'optparse'

class Pascal
  BASE_SPACES = 1
  BASE_PADDING = 20

  def initialize
    @options = Options.new(0, BASE_SPACES, BASE_PADDING, false)
    parse_options!
  end

  def print_triangle
    print_pascal(options.num_rows, num_space: options.num_space, padding: options.padding, diamond: options.diamond)
  end

  private

  attr_reader :options

  def parse_options!
    OptionParser.new do |opts|
      opts.on("-n NUM_ROWS", "--num_rows=NUM_ROWS", "Number of rows in triangle") do |num_rows|
        options.num_rows = num_rows.to_i
      end

      opts.on("-s NUM_SPACE", "--num_space=NUM_SPACE", "Number of spaces between adjacent cells") do |num_space|
        options.num_space = num_space.to_i
      end

      opts.on("-p PADDING", "--padding=PADDING", "Left-padding to help center triangle") do |padding|
        options.padding = padding.to_i
      end

      opts.on("-d", "--diamond", "Print as a diamond") do |diamond|
        options.diamond = diamond
      end

      opts.on("-h", "--help", "Print out usage information") do
        puts opts
        exit
      end
    end.parse!
  end

  def next_row(previous_row)
    tmp_row = previous_row.dup
    tmp_row << 0
    (tmp_row.reverse).zip(tmp_row).collect { |a, b| a + b }
  end

  def pascal(n)
    rows = [[1]]
    return [] if n ==  0

    (0...n - 1).inject(rows) { |triangle, _| triangle << next_row(triangle.last) }
  end

  def formatted_row_string(row, num_space: BASE_SPACES, padding: BASE_PADDING)
    raw = row.join(" " * num_space)
    raw.center(padding)
  end

  def print_pascal(n, num_space: BASE_SPACES, padding: BASE_PADDING, diamond: false)
    rows = pascal(n)
    rows.each do |row|
      puts formatted_row_string(row, num_space: num_space, padding: padding)
    end

    if diamond
      rows.reverse.drop(1).each do |row|
        puts formatted_row_string(row, num_space: num_space, padding: padding)
      end
    end
  end

  Options = Struct.new(:num_rows, :num_space, :padding, :diamond)
end

Pascal.new.print_triangle

