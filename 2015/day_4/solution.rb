require 'digest'

class PasswordDigestor
  def initialize num_of_zero
    @num_of_zero = num_of_zero
  end
  def combine secret_key, num
    secret_key + num.to_s
  end

  def digest secret_key
    num = 1
    while num
      feed = combine secret_key, num
      md5_hash = Digest::MD5.hexdigest feed
      break if meet_condition md5_hash, @num_of_zero
      num += 1
    end
    num
  end

  def meet_condition md5_hash, num_of_zero
    md5_hash[0..num_of_zero - 1] == '0' * num_of_zero
  end
end
