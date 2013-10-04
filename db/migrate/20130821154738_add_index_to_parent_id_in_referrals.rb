class AddIndexToParentIdInReferrals < ActiveRecord::Migration
  def change
    add_index :referrals, :parent_id
  end
end
