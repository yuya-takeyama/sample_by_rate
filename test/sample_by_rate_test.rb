require 'test/unit'
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sample_by_rate'

class TestSampleByRate < Test::Unit::TestCase
  sub_test_case '#sample_by_rate' do
    sub_test_case 'without block' do
      setup do
        @range = (1..100000)
        @range.extend SampleByRate
      end

      test 'do sampling correctly' do
        assert_maybe_sampled_correctly @range.sample_by_rate(0.1), 10000
        assert_maybe_sampled_correctly @range.sample_by_rate(0.5), 50000
        assert_maybe_sampled_correctly @range.sample_by_rate(0.9), 90000
        assert_maybe_sampled_correctly @range.sample_by_rate(Rational(1, 3)), 33333
      end

      test 'with argument 0' do
        assert_equal 0, size_of_enumerable(@range.sample_by_rate(0))
      end

      test 'with argument 1' do
        assert_equal 100000, size_of_enumerable(@range.sample_by_rate(1))
      end

      def assert_maybe_sampled_correctly(sampled, expected_size)
        size = size_of_enumerable(sampled)

        assert size >= (expected_size * 0.95)
        assert size <= (expected_size * 1.05)
      end

      def size_of_enumerable(enumerable)
        enumerable.reduce(0) {|acc, n| acc + 1 }
      end
    end

    sub_test_case 'invalid argument' do
      setup do
        @range = (1..10)
        @range.extend SampleByRate
      end

      test '-1 is invalid argument' do
        assert_raise do
          @range.sample_by_rate -1
        end
      end

      test '1.1 is invalid argument' do
        assert_raise do
          @range.sample_by_rate 1.1
        end
      end
    end
  end
end
