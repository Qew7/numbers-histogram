class Histogramator

  DEFAULT_STRING = '123456789012345678909999991234569999'.freeze

  def initialize
    @numbers = (ARGV.first || DEFAULT_STRING)[/\d+/]
      .split(//).map{|n| n.to_i }
    @unique_numbers = numbers.uniq.sort
  end

  def call
    print_result_without_zeros
    print_zero_if_present
  end

  private

  private_constant :DEFAULT_STRING

  attr_accessor :unique_numbers, :numbers

  def print_result_without_zeros
    unique_numbers.each do |i|
      next if i == 0
      puts result_string_template(i)
    end
  end

  def print_zero_if_present
    puts result_string_template(0) if unique_numbers.any? 0
  end

  def result_string_template(i)
    "#{i} #{'*' * numbers.count(i)}"
  end
end
