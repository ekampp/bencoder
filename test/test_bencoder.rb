require 'minitest/autorun'
require 'bencoder'
require 'coveralls'

class TestBencoder < Minitest::Test
  Coveralls.wear!
  def setup
    @be = BEncoder
  end

  #encoding

  def test_string_encoding
    assert_equal '7:Someday', @be.encode('Someday')
  end

  def test_int_encoding
    assert_equal 'i123e', @be.encode(123)
  end

  def test_array_encoding
    assert_equal 'l3:hey5:theree', @be.encode(['hey', 'there'])
  end

  def test_hash_encoding
    assert_equal 'd4:what2:is2:up4:dawge', @be.encode({what: 'is', up: 'dawg'})
  end

  def test_nested_encoding
    assert_equal 'ld4:somel5:times3:youe5:gotta3:let2:go1:!ei2e5:wooooli1e1:21:3ee', @be.encode([{'some' => ['times', 'you'], gotta: 'let', go: '!'}, 2, "woooo", [1, '2', "3"]])
  end

  #decoding

  def test_string_decoding
    assert_equal "I'm free!", @be.decode("9:I'm free!")
  end

  def test_int_decoding
    assert_equal 321, @be.decode('i321e')
  end

  def test_array_decoding
    assert_equal ['1', 2, 3], @be.decode('l1:1i2ei3ee')
  end

  def test_hash_decoding
    assert_equal({'abc' => 'def', 'ghi' => 32}, @be.decode("d3:abc3:def3:ghii32ee"))
  end

  def test_nested_decoding
    assert_equal [{'some' => ['times', 'you'], 'gotta' => 'let', 'go' => '!'}, 2, "woooo", [1, '2', "3"]], @be.decode('ld4:somel5:times3:youe5:gotta3:let2:go1:!ei2e5:wooooli1e1:21:3ee')
  end
end
