class Page < ActiveRecord::Base
  
  after_create :scrape
  
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  
  @@urls_to_use = %w[
    http://google.com
    http://pitchfork.com
    http://myself.com
  ]

  def self.default
    self.first or self.create(
      :url => @@urls_to_use.sample
    )
  end

  def self.sample
    self.create(:url => @@urls_to_use.sample)
  end
  
  def public_url
     "/assets/pages/#{id}/image.png"
  end

  def scrape
    Thread.new { 
      output = `phantomjs #{Rails.root}/bin/screencap.js #{self.url} #{self.id}`.strip
      self.image = output
      save!
    }
  end
  
  
end
