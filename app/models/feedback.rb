class Feedback < ActiveRecord::Base
  attr_accessible :email, :message, :name

  validates :name,           :presence => true, :format  => { :with => /^[A-z .'-]+$/,
                             :message  => "Enter only characters",:allow_blank => true },
                             :length   => { :maximum => 15,  :message => "Enter within 5 - 15 characters ",
                             :allow_blank => true   }
	validates :email  ,        :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,:message  => "Invalid Email Format"},
                             :length   => {:maximum=>150, :allow_blank => true}  
	validates :message,        :presence => true, :length => {:maximum=>500, :allow_blank => true}  
end
