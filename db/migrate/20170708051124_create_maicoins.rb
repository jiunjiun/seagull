class CreateMaicoins < ActiveRecord::Migration[5.1]
  def change
    create_table :maicoins do |t|
      t.string :kind
      t.float :buy
      t.float :sell
      t.float :avg

      t.timestamps
    end
  end
end
