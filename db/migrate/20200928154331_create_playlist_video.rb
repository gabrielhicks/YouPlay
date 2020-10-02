class CreatePlaylistVideo < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_videos do |t|
      t.belongs_to :video, null: false, foreign_key: true
      t.belongs_to :playlist, null: false, foreign_key: true
    end
  end
end
