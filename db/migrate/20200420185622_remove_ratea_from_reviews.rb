class RemoveRateaFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :ratea, :float
  end
end
