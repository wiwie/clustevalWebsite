class SubmitDatasetsController < ApplicationController

	def create
		@submit_dataset = SubmitDataset.create(
			:email => params[:submit_dataset][:email],
			:firstname => params[:submit_dataset][:firstname],
			:lastname => params[:submit_dataset][:lastname],
			:institution => params[:submit_dataset][:institution],
			:description => params[:submit_dataset][:description])
		if not @submit_dataset.errors.any?
			UserMailer.submit_dataset(@submit_dataset).deliver
			UserMailer.submit_dataset_admin(@submit_dataset).deliver
			flash[:notice] = '<h3>Thanks for your submit request!</h3>
	We sent you an email with further information about how to submit a dataset to our platform.'
			redirect_to(:controller => 'submits', :action => 'index')
		end
	end

	def index
		@submit_dataset = SubmitDataset.new
	end
end
