require 'spec_helper'

describe Episode do
  context "Mass Assignment" do
		it { should allow_mass_assignment_of(:title)                               }
		it { should allow_mass_assignment_of(:description)                         }
		it { should allow_mass_assignment_of(:picture)                             }
    it { should allow_mass_assignment_of(:video)                               }
    it { should allow_mass_assignment_of(:note)                                }
    it { should_not allow_mass_assignment_of(:created_at)											 }
    it { should_not allow_mass_assignment_of(:updated_at)                      }
    
    it " Image should be valid" do
  		picture = Episode.new :picture => fixture_file_upload('images/rails.png', 'image/png').should be_valid
		end

		it "Video should be valid" do
  		video = Episode.new :video => fixture_file_upload('images/rails.ogv', 'videos/mp4').should be_valid
		end

  end
end
