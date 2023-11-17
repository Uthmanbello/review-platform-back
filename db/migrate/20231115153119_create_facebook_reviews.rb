class CreateFacebookReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :facebook_reviews do |t|
      t.string :full_name
      t.string :username
      t.text :review_text

      t.timestamps
    end
  end
end
