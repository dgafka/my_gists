class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "first_name", :limit => 25;
      t.string "last_name", :limit => 25;
      t.string "email", :limit => 100, :default => "";
      t.string "username", :null => false, :limit => 25;
      t.string "password_digest";

      t.timestamps
    end

    add_index("users", "username")

  end
end
