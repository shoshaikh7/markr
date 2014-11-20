class Article < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable
  acts_as_taggable_on :tag

  def thumbnail
    LinkThumbnailer.generate(self.url).images.first.src
  end
end
