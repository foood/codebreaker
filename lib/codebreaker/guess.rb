module Codebreaker
  class Guess

    attr_reader :value

    def initialize value
      @value = value
    end

    def valid?
     if @value =~ /^[1-6]{4}$/

      true

     else

      false

     end
    end

  end
end