class Pet < ApplicationRecord
    has_many :pet_histories, dependent: :destroy

    def to_s
        return name
    end

    def histories_count
        self.pet_histories.count
    end

    def average_weight
        self.pet_histories.sum(:weight)
    end

    def average_height
        self.pet_histories.sum(:height)
    end

    def max_weight
        self.pet_histories.maximum(:weight)
    end

    def max_height
        self.pet_histories.maximum(:height)
    end

end
