class Tournaments < ActiveRecord::Migration[5.0]
  def change
    create_table  :tournaments do |t|
      t.string :title
      t.text :desc
      t.date :start_date
      t.date :end_date
      t.integer :pos
      t.boolean :active
      t.timestamps
    end

    Tournament.create(
      title: 'I Турнир Орловской волейбольной лиги',
      start_date: '2016/12/01',
      end_date: '2016/12/01',
      active: true,
    )
  end
end
