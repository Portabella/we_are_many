class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :job
      t.string  :city
      t.string  :country
      t.text    :description
      t.text    :external_ids
      t.text    :photos
      t.timestamps
    end

    create_table :interests do |t|
      t.string :name
    end

    create_table :user_interests do |t|
      t.belongs_to :interest
      t.belongs_to :user
      t.text    :value
    end
    add_index :user_interests, [:interest_id, :user_id]

    create_table :networks do |t|
      t.string :name
    end

    create_table :user_networks do |t|
      t.belongs_to :network
      t.belongs_to :user
    end
    add_index :user_networks, [:network_id, :user_id]

  end
end
