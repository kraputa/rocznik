class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
			t.integer :year
      t.integer :volume
    end
		add_reference :issues, :person, index: true, foreign_key: true
    add_reference :submissions, :issue, index: true,  foreign_key: true
  
  end
end
