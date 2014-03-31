namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'ffaker'
    #[Episode].each(&:delete_all)
    Episode.populate 3 do |p|
      p.title     = Populator.words(1..3).titleize + " (reviced)"
      p.description    =  Populator.sentences(2)
			p.category_id = 5
			p.note = Populator.sentences(2..10)
      p.episode_type = 2
    end
  end
end