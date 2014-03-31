class User < ActiveRecord::Base
  attr_accessible :email, :mobile_no, :name, :password, :password_confirmation,:role_name, :purchased_at

  has_many :comments;
  has_one :login;
  has_many :stars
  has_one :subscription
  

  has_secure_password

  #validations

  validates :name,           :presence => true, :format  => { :with => /^[A-z .'-]+$/,
                             :message  => "Enter only characters",:allow_blank => true },
                             :length   => { :maximum => 25,  :message => "Enter within 5 - 25 characters ",
                             :allow_blank => true   }
	validates :email  ,        :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,              				                       :message  => "Invalid Email Format"}, :uniqueness => true,
                             :length   => {:maximum=>150, :allow_blank => true}  
	validates :mobile_no,      :presence => true, :format => { :with  => /^[\d]+$/,
                             :message  => "should be enter only digits",:uniqueness => true,:allow_blank => true },
                             :length   => { :maximum => 12,:minimum => 10, :message => "Enter within 10-12 digits ",
                             :allow_blank => true   }
	validates :password,       :presence => {:on => :create}, :format   => { :with => /^[\w\W]{5,10}$/ ,
                             :allow_blank => true}, :confirmation => true


  def self.authenticate(login, password)
    find_by_email(login).try(:authenticate, password)
  end


end
