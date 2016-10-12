class StoriesController < ApplicationController
    before_action :find_story, only: [:edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@stories = Story.all
	end

	def new
		@story = current_user.stories.build
	end

	def create
		@story = current_user.stories.build(story_params)

		if @story.save
			redirect_to stories_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @story.update(story_params)
			redirect_to stories_path
		else
			render 'edit'
		end
	end

	def destroy
		@story.destroy
		redirect_to root_path
	end

	private

	def find_story
		@story = Story.find(params[:id])
	end

	def story_params
		params.require(:story).permit(:title, :story, :quote, :author)
	end
end
