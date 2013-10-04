require 'spec_helper'

describe Referral do
  describe "assignment" do
    it { should_not allow_mass_assignment_of :parent_id }
    it { should_not allow_mass_assignment_of :count }
    it { should_not allow_mass_assignment_of :code }

    it { should allow_mass_assignment_of :fullname }
    it { should allow_mass_assignment_of :email }
    it { should allow_mass_assignment_of :twitter_handle }
  end
end
