class NotesController < ApplicationController
before_filter :login_required
	include SessionsHelper
	before_action :correct_user,   only: [:edit, :update, :destroy]
	
  def index
  	@notes = current_user.notes
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = current_user.notes.build(note_params) if logged_in?
  	if(@note.save)
		  redirect_to notes_path
  	else
  		render 'new'
  	end
  end

	def edit
	end

	def update
		if @note.update(note_params)
			redirect_to notes_path
		else
			render 'edit'
		end
	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end

  private

  	def note_params
  		params.require(:note).permit(:title, :content)
  	end

	def correct_user
      @note = current_user.notes.find_by_id(params[:format])
      redirect_to root_url if @note.nil?
    end

end
