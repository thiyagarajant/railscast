module EpisodesHelper
	def category_list
	  Category.all
	end
	
	def episodes_list(x, y)
	  Episode.where(:category_id => x ).where("id NOT IN (?)", y)
	end
	def find_category(x)
      Episode.find(x).category_id
  end
  def comment_count(x)
   # Rails.cache.fetch("no_cmts#{x}") do
  	 x.comments.count
    #end
  end
  def parent_comment(x)
  	Comment.where(:parent_id => x) 
  end
  def category_name(x)
  	 Category.find(x).name
  end
  def search_param(x = nil)
  	x!=nil ? x : "" 
  end
  def category_param(x = nil)
  	x!=nil ? x : "" 
  end
  def vote_for_like(x)
    Like.where(:episode_id => x).where(:no_of_like => 1).count
  end
  def epi_type(params)
    if params=="0"
      return "Free Episodes"
    elsif params == "1"
      return "Pro Episodes"
    elsif params == "2"
      return "Reviced Episodes"
    end
  end

  def subscribed_user(episode)

   if current_user.try(:purchased_at) != nil && current_user.try(:purchased_at) > (Time.now - 30.days)
    return true
  else 
    return false
  end
  end
end
