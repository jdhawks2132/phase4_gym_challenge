class GymsController < ApplicationController
	before_action :set_gym, only: %i[show update destroy]

	def index
		render json: Gym.all, status: :ok
	end

	def show
		@gym = Gym.find_by!(id: params[:id])

		render json: @gym, status: :ok
	rescue ActiveRecord::RecordNotFound
		render json: { error: 'Item Not Found' }, status: :not_found
	end

	def update
		if @gym.update(gym_params)
			render json: @gym, status: :ok
		else
			render json: @gym.errors.full_messages, status: :unprocessable_entity
		end
	end

	def destroy
		@gym = Gym.find_by!(id: params[:id])
		@gym.destroy
		render json: {}, status: :ok
	rescue ActiveRecord::RecordNotFound
		render json: { error: 'Item Not Found' }, status: :not_found
	end

	private

	def set_gym
		@gym = Gym.find_by!(id: params[:id])
	end

	def gym_params
		params.permit(:name, :address)
	end
end
