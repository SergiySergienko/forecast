module Modifiers
  class Base
    def handle(data)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end