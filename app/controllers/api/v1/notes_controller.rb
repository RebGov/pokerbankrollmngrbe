class Api::V1::NotesController < ApplicationController
  skip_before_action :check_authentication
  def create
    note = Note.create(note_params)
    if gameName.valid?
      render json: { note: note }
    else
      render json: { errors: note.errors}
    end
  end

  def index
    notes = Note.all
    render json: { notes: notes }
  end

  def update
  end

  def delete
  end

  private

  def note_params
    params.permit(:id, :note, :played_game_id)
  end
end
