class Api::V1::PlayedGamesController < ApplicationController
   skip_before_action :check_authentication
  # has_scope :start_date_time, using: %i[started_at ended_at], type: :hash
  # has_scope :for_user do |controller, scope, value|
  #   scope.for_course(course_id: value)
  # end
  def create

      playedGame = PlayedGame.create(played_games_params)
      if playedGame.valid?
        render json: { playedGame: playedGame }
      else
        render json: { errors: playedGame.errors}
      end

  end

  def index
   parameter_list=['game_location_id','game_name_id','blinds_name_id','user_id', 'kill_status_id','start_date','end_date']
   search_str=''
   first=true
   no_search_parms=true
   is_user_id=false
   puts "MMMMMMMMM"
   params.each do |key,value|
     #Rails.logger.warn "Param #{key}: #{value}"
      if parameter_list.include?(key)
        no_search_parms=false
        if key == 'user_id'
          is_user_id=true
        end
        if first != true
          tmp=" and "
          if key == 'start_date'
            
            print "Found start date"
            tmp.concat('start_date_time>="')
            tmp.concat("#{value}")
            tmp.concat('"')
            fist=false
          elsif key == 'end_date'
            tmp.concat('start_date_time<="')
            tmp.concat("#{value}")
            tmp.concat('"')
            first=false
          else
            tmp.concat("#{key}=#{value}")
          end
        else
          if key == 'start_date'
            tmp.concat('start_date_time>="')
            tmp.concat("#{value}")
            tmp.concat('"')
            first=false
          elsif key == 'end_date'
            tmp.concat('start_date_time<="')
            tmp.concat("#{value}")
            tmp.concat('"')
            first=false
          else
            tmp="#{key}=#{value}"
            first=false
          end
        end
        search_str.concat(tmp)
        #puts "TMPSTR is #{tmp}"
      end
    end
    puts "TMPSTR #{search_str}"
    #search_str='user_id=1 and start_date_time >= "2014-08-9"'
    if is_user_id == true
      playedGames = PlayedGame.where(search_str).order('start_date_time DESC')
    end

    if is_user_id == false
      render json: { error: 'unauthorized... valid user id required'}
    else
      render json: {playedGames: playedGames}, include: [ :game_location, :notes, :blinds_name, :game_name, :kill_status ]
    end
  end
    # , include: [ :game_location, :notes, :blinds_name, :game_name, :kill_status ]}
    # , include: { played_games: { include: [ :game_location, :notes, :blinds_name, :game_name, :kill_status ]}}
    # .to_date..Date.current
    # playedGames = PlayedGame.where(start_date_time: 4.years.ago.all_year).order("start_date_time desc")
     # playedGames = PlayedGame.where(user_id: 1).where(start_date_time: 3.years.ago.to_date..Date.current)
  def show
    playedGame = PlayedGame.find(params[:id])
    render json: {playedGame: playedGame}, include: [ :game_location, :notes, :blinds_name, :game_name, :kill_status ]
  end

  def update
  end

  def delete
  end

  private

  def played_games_params
    params.permit(:id, :user_id, :start_date_time, :end_date_time, :buy_in, :cash_out, :game_location_id, :game_name_id, :blinds_name_id, :kill_status_id, :tournament, :notes_id, :profit, :minutes, :won_game, game_name_attributes: [ :game_title ], game_blinds_attriubutes: [:blinds], game_location_attributes: [:place] )
  end
end
