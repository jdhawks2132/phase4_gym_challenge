class ClientsController < ApplicationController
	before_action :set_client, only: %i[show update]
	def index
		render json: Client.all, status: :ok
	end

	def show
		total = { total: @client.memberships.sum(:charge) }
		render json: { client: client, total: total }, status: :ok
	rescue ActiveRecord::RecordNotFound
		render json: { error: 'Item Not Found' }, status: :not_found
	end

	def update
		if @client.update(client_params)
			render json: @client
		else
			render json: @client.errors, status: :unprocessable_entity
		end
	end

	private

	def set_client
		@client = Client.find_by!(id: params[:id])
	end

	def client_params
		params.permit(:name, :age)
	end
end
