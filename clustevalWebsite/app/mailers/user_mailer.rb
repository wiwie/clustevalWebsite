class UserMailer < ActionMailer::Base
  default from: "clusteval@clusteval.mmci.uni-saarland.de"

  def submit_dataset(submit_dataset)
  	@email = submit_dataset.email
  	@firstname = submit_dataset.firstname
  	@lastname = submit_dataset.lastname
  	@institution = submit_dataset.institution
  	@description = submit_dataset.description
  	mail(:to => @email, :subject => "clusteval - Submitting a dataset") do |format|
      format.text
    end
  end

  def submit_dataset_admin(submit_dataset)
    @email = submit_dataset.email
    @firstname = submit_dataset.firstname
    @lastname = submit_dataset.lastname
    @institution = submit_dataset.institution
    @description = submit_dataset.description
    mail(:to => "clusteval@clusteval.mmci.uni-saarland.de",:from => @email, :subject => "clusteval - Dataset request") do |format|
      format.text
    end
  end

  def submit_method(submit_method)
  	@email = submit_method.email
  	@firstname = submit_method.firstname
  	@lastname = submit_method.lastname
  	@institution = submit_method.institution
  	@description = submit_method.description
  	mail(:to => @email, :subject => "clusteval - Submitting a clustering method") do |format|
      format.text
    end
  end

  def submit_method_admin(submit_method)
    @email = submit_method.email
    @firstname = submit_method.firstname
    @lastname = submit_method.lastname
    @institution = submit_method.institution
    @description = submit_method.description
    mail(:to => "clusteval@clusteval.mmci.uni-saarland.de", :from => @email, :subject => "clusteval - Clustering method request") do |format|
      format.text
    end
  end
end
