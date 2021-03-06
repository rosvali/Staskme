class Mission < ApplicationRecord
    belongs_to :category
    has_many :enrollments
    has_many :users, through: :enrollments

    validates :title, presence: true
    validates :title, length: { in: 3..100 }

    validates :description, presence: true
    validates :description, length: { in: 10..200 }

    validates :start_date, presence: true
    validate :in_the_past?

    private

    def in_the_past?
        errors.add(:start_date, "must be in the future") unless start_date > DateTime.now
    end

end