class DatasetTypesController < ApplicationController
  def self.all(*args)
  	@repositoryType = RepositoryType.find_by_name("Repository")
  	@repository = Repository.find_by_repository_type_id(@repositoryType.id)
  	return self.find(:all, :conditions => ["repository_id = ?",@repository.id])
  end
end
