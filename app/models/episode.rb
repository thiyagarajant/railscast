class Episode < ActiveRecord::Base
  attr_accessible :category_id, :description, :note, :picture, :title, :video, :avg_rating,
                    :view_count, :episode_type

  belongs_to :category
  has_many :likes
  has_many :comments
  has_many :stars

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "120x200>" }
	has_attached_file :video

  # Paperclip Validations
  #validates_attachment :picture, :presence => true,:content_type => { :content_type => ['image/jpeg', 'image/png'] },
      #                  :size => { :less_than => 5.megabytes}

  # validates_attachment_presence :video
  # validates_attachment_content_type :video, :content_type => ['video/ogv'],:message => "Sorry, right now we only support MP4 video"


  def self.list(keyword='', category_id='', type = '')

    #cache_key = "episodes_#{keyword}_#{category_id}"
    #Rails.cache.fetch(cache_key) do
      arel = order("created_at DESC")
      arel = arel.joins(:category).where("episodes.title like ? or categories.name like ? ",
               "%#{keyword}%",  "%#{keyword}%") if keyword.present?
      arel = arel.where("category_id = #{category_id}") if category_id.present?
      arel = arel.where("episode_type = #{type}") if type.present?
      arel.all

    #end
  end

   def nested_comments
    #raise self.comments.where(:parent_id => 0).inspect
     cmts =  self.comments
     @g = []

     cmts.each do |c|

       children = Comment.where(:parent_id => c.id)
        children = children.collect{|x| x.id }
      #end
       child = Comment.where(:id => [children])
       @g <<  [c].concat(child)
       @g <<  [c].concat(call(child))
   end

     return @g.flatten.uniq(&:id)
  end

  def call(s)
    cool = []
    s.each do|c|
      cool << Comment.where(:parent_id => [c])
      @g << cool
    end
    cool.each do|d|
      call(d)
      @g << cool
    end
  end

  def get_rating
    s = []
   # Rails.cache.fetch("rating") do
      self.stars.collect{|x| s << x.rating}
      self.avg_rating = (s.sum / s.length).round if s.length >0
   # end
  end

  def update_view_count(count)
    count.view_count = 0  if count.view_count == nil
    update_attributes(:view_count => count.view_count + 1)
  end

end



