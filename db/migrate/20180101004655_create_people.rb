class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string      :name
      t.string      :phone_number
      t.references  :family
      t.boolean     :creator
      t.boolean     :chosen
      t.integer     :giftee_id
      t.string      :password

      t.timestamps
    end
  end
end
