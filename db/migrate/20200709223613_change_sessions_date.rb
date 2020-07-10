class ChangeSessionsDate < ActiveRecord::Migration[6.0]
  def change
    change_column :sessions, :date, :datetime
  end
end
