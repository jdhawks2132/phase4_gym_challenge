class MembershipsController < ApplicationController
	def create
		@membership = Membership.new(membership_params)

		if @membership.save
			render json: @membership, status: :created, location: @membership
		else
			render json: @membership.errors.full_messages,
			       status: :unprocessable_entity
		end
	end

	private

	def membership_params
		params.permit(:gym_id, :client_id, :charge)
	end
end
