require "sample_by_rate/version"

module SampleByRate
  def sample_by_rate(rate)
    raise 'rate must greater than or equal to 0 and less than  or equal to 1' unless rate >= 0 and rate <= 1

    return enum_for(__method__, rate) unless block_given?

    each {|n| yield n if rand < rate }
  end
end
