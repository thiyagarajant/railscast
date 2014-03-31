require 'spec_helper'

describe User do
	before do
		@user = User.create(:name => 'test',:email=> 'test@gmail.com',
												:password => 'password',:password_confirmation =>'password')
	end
	context "Mass Assignment" do
		it { should allow_mass_assignment_of(:name)                              }
		it { should allow_mass_assignment_of(:password)                          }
		it { should allow_mass_assignment_of(:password_confirmation)             }
    it { should allow_mass_assignment_of(:email)                             }
        it { should allow_mass_assignment_of(:mobile_no)                             }

		it { should_not allow_mass_assignment_of(:created_at)                    }
    it { should_not allow_mass_assignment_of(:updated_at)                    }
	end    
	
	context "Validation" do
		it { should validate_presence_of(:name)                                                }
		it { should ensure_length_of(:name)                                 }
		it { should validate_format_of(:name).with('stevemartin')                              }
		it { should validate_presence_of(:password)                                            }
		it { should validate_confirmation_of(:password)                                        }
    it { should validate_presence_of(:email)                                               }
    it { should ensure_length_of(:email).is_at_most(150)                                   }
    it { should validate_format_of(:email).with('test@example.com')                        }
    
  end

  
end