class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :played_games , :blind_name, :note, :game_name, :game_location
end
