class AddVineyardNameWineTypeVintageDesignationBrandNameProvenanceToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :vineyard_name, :string
    add_column :addresses, :wine_type, :string
    add_column :addresses, :vintage, :integer
    add_column :addresses, :designation, :string
    add_column :addresses, :brand_name, :string
    add_column :addresses, :provenance, :string
  end
end
