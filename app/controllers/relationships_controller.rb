class RelationshipsController < ApplicationController
	def create
		@relationship = current_user.relationships.build(:friend_id => params[:friend_id])
		if @relationship.save
			flash[:notice] = "Followed successfully." redirect_to profile_path(current_user.friend_id)
		else
			flash[:notice] = "Unable to follow." redirect_to root_path

		end
	end
def destory
	@relationship = current_user.relationships.find(parmas[:id]) 
	@relationship.destroy flash[:notice] = "No longer following."
	redirect_to profile_path(current_user.id)
end

	private
	def relationship_params
		params.require(:relationship).permit(:user_id, :friend_id)
	end
end
