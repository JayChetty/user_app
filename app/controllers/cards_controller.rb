class CardsController < ApplicationController

	def index
		@user = current_user
		@received_cards = current_user.received_cards.all(:order => "created_at DESC")	
		@sent_cards = current_user.sent_cards.all(:order => "created_at DESC")
	end

	def new
		@user = current_user
		@card = current_user.sent_cards.new
		if params[:receiver_id] && params[:receiver_id].to_i != current_user.id
			@receiver = User.find(params[:receiver_id])
		else
			#need to find your friend
			@friends = current_user.friends.all
			render "cards/choose_receiver"
		end

		if params[:item_id]
		  @item = Item.find(params[:item_id])
		end

	end

	def create
		@card = current_user.sent_cards.build(sender_id: current_user.id, receiver_id: params[:card][:receiver_id], message: params[:card][:message], item_id: params[:card][:item_id])
		if @card.save
			flash[:success] = "Card Created"
			redirect_to user_cards_path(current_user)
		else
			flash.now[:error] = "Couldn't create card"
			render action: "new"
		end	
	end	

	def destroy
		@card = current_user.received_cards.find(params[:id])
		if @card.destroy
			flash[:success] = "Card Destroyed"
		else
			flash[:success] = "Card Destroyed"
		end
		redirect_to user_cards_path(current_user)
	end
end
