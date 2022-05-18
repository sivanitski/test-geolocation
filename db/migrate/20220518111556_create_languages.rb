class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string      :code
      t.string      :name
      t.string      :native
      t.belongs_to  :location
      t.timestamps
    end
  end
end
