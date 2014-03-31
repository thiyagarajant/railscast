class Login < ActiveRecord::Base
  attr_accessible :email, :provider, :uid, :user_id
  belongs_to :user

  def self.find_from_hash(hash, user = nil)
  	find_by_provider_and_uid(hash[:provider], hash[:uid])
  end

  def self.find_or_create_from_hash(hash, user = nil)
  	rec = find_or_initialize_by_provider_and_uid(hash[:provider], hash[:uid].to_s)
  	rec.email = hash[:info]['email']
  	rec.save unless rec.persisted?
  	rec
  end

  def associate_user(user_id)
  	update_attributes({:user_id => user_id})
  end

end
