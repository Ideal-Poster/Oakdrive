class Episode < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "240x240>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :mp3
  validates_attachment :mp3,
      :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] },
      :file_name => { :matches => [/mp3\Z/] }
  def self.search(search, title, description, guests)
    where("title LIKE ? OR description LIKE ? OR guests LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
