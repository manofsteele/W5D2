class CreatePostSubsAgain < ActiveRecord::Migration[5.1]
  def change
    create_table :post_subs do |t|
      t.references :postable, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end
