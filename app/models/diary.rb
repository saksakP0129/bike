class Diary < ApplicationRecord
    belongs_to :user

    mount_uploader :image, ImageUploader

    def self.search(search)
        return Diary.all unless search
        Diary.where('text LIKE(?)', "%#{search}%")
    end
end
