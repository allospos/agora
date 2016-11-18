class CreateVerificationMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :verification_methods do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :token
      t.datetime :verified_at
      t.datetime :expires_at

      t.timestamps
    end
  end
end
