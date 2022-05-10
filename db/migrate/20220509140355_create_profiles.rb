class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :phonenumber
      t.string :partnercode
      t.string :firstname
      t.string :midname
      t.string :lastname
      t.string :address
      t.string :unitnumber
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :sex
      t.datetime :birth
      t.string :ssnortin 
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
