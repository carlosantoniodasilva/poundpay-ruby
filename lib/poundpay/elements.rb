require 'poundpay/resource'

class PaymentReleaseException < Exception
end

module Poundpay
  class Developer < Resource
    def self.me
      find(self.user)
    end
  end

  class Payment < Resource
    def release
      unless status == 'ESCROWED'
        raise PaymentReleaseException.new "Payment status is #{status}.  Only ESCROWED payments may be released"
      end
      status = 'RELEASED'
      save
    end
  end
end