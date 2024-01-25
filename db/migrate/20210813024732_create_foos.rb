# frozen_string_literal: true

class CreateFoos < ActiveRecord::Migration[4.2]
  def change
    create_table :foos do |t|
      t.string :bar

      t.timestamps null: false
    end
  end
end
