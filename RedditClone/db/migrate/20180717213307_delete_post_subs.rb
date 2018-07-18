class DeletePostSubs < ActiveRecord::Migration[5.1]
  def change
    drop_table :post_subs
  end
end
