class AddOptionValueAndKeywordToSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :option_value, :string
  	add_column :searches, :keyword, :string
  end
end
