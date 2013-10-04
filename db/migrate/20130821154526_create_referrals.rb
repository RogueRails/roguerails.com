class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.integer :parent_id
      t.string :fullname
      t.string :email
      t.string :twitter_handle
      t.string :code
      t.integer :count

      t.timestamps
    end
  end
end
