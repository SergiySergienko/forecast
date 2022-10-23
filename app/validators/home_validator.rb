class HomeValidator
    include ActiveModel::Validations

    attr_accessor :address

    def initialize(address)
        @address = address
    end

    validates_with SearchValidator
end