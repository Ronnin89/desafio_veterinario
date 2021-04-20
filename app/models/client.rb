class Client < ApplicationRecord
    has_many :pets, dependent: :destroy

    def to_s
        return name
      end
    
    def pets_count
        self.pets.count
    end
end
