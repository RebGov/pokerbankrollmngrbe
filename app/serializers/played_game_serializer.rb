class PlayedGameSerializer < ActiveModel::Serializer
  attributes :user, :played_games, :blinds, :game_title, :name, :note_content, :place
end
