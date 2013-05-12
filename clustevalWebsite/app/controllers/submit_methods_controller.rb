class SubmitMethodsController < ApplicationController

	def create
		@submit_method = SubmitMethod.create(
			:email => params[:submit_method][:email],
			:firstname => params[:submit_method][:firstname],
			:lastname => params[:submit_method][:lastname],
			:institution => params[:submit_method][:institution],
			:description => params[:submit_method][:description])
		if not @submit_method.errors.any?
			UserMailer.submit_method(@submit_method).deliver
			UserMailer.submit_method_admin(@submit_method).deliver
			flash[:notice] = '<h3>Thanks for your submit request!</h3>
	We sent you an email with further information about how to submit a clustering method to our platform.'
			redirect_to(:controller => 'submits', :action => 'index')
		end
	end

	def index
		@submit_method = SubmitMethod.new
	end
end
