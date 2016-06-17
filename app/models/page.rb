class Page < ActiveRecord::Base
  
  
  after_create :scrape
  
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" 
  }
  
  @@format = "jpg"
  
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
     "/assets/pages/#{id}/image.#{@@format}"
  end

  def scrape
    #Thread.new {
      logger.debug "Thread"
      phantom_bin = `which phantomjs`.strip
      logger.debug phantom_bin
      output = `#{phantom_bin} #{Rails.root}/bin/screencap.js #{self.url} #{self.id} #{@@format}`.strip
      self.image = output
      save!
      # }
      self
  end
  
end