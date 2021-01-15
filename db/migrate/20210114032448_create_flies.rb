class CreateFlies < ActiveRecord::Migration[6.1]
  def change
    create_table :flies do |t|
      t.references :from
      t.references :to
      t.timestamps
    end
  end
end
