class CreateGiftIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :gift_ideas do |t|
      t.string     :gift_idea
      t.references :person

      t.timestamps
    end
  end
end
