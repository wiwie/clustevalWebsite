class Dataset < ActiveRecord::Base
  belongs_to :repository
	belongs_to :dataset_format
  belongs_to :dataset
  belongs_to :dataset_type
  has_many :dataset_configs

  def self.all(repository, *args)
  if repository
    return self.find(:all, :conditions => ["repository_id = ?",repository])
  else
    return super.all
  end
  end

  def name
  	#return (absPath.split('/')[-2] + '/' + absPath.split('/')[-1])
    return (self.alias)
  end

  def full_name
    return (absPath.split('/')[-2] + '/' + absPath.split('/')[-1])
  end

  def imageUrl
    @image = DatasetImage.find_by_dataset_fullName(self.full_name)
    if @image
      return @image.dataset_imageUrl
    else
      return nil
    end
  end

  def description
    @descr = DatasetDescription.find_by_dataset_fullName(self.full_name)
    if @descr
      return @descr.dataset_description
    else
      return nil
    end
  end

  def publication
    @pub = DatasetPublication.find_by_dataset_fullName(self.full_name)
    if @pub
      return @pub.dataset_publication
    else
      return nil
    end
  end

  def publicationUrl
    @pub = DatasetPublication.find_by_dataset_fullName(self.full_name)
    if @pub
      return @pub.dataset_publicationUrl
    else
      return ''
    end
  end
end
