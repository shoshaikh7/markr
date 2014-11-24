class Article < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable
  acts_as_taggable_on :tag

  def set_image
    self.image_url = LinkThumbnailer.generate(self.url).images.first.src.to_s
  end
end
