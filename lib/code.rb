class Code
  attr_reader :secret_code

  def initialize
    @secret_code = make_secret_code
  end
  # have computer create a secret code and store it.
  def make_secret_code
    secret_code = []
    4.times do |i|
      secret_code[i] = rand(1..6)
    end
    return secret_code
  end
end