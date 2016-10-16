class InitDb < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.text  "question"
      t.text  "answer"
      t.timestamps
    end
  end
end
    