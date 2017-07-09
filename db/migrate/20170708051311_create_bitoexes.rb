class CreateBitoexes < ActiveRecord::Migration[5.1]
  def change
    create_table :bitoexes do |t|
      t.string :kind
      t.float :buy
      t.float :sell
      t.float :avg

      t.timestamps
    end
  end
end
