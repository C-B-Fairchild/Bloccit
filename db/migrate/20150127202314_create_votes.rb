class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end

    def down
      drop_table :votes
    end
  end
end
