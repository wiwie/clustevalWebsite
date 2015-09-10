class Dataset < ActiveRecord::Base
  belongs_to :repository
	belongs_to :dataset_format
  belongs_to :dataset
  belongs_to :dataset_type
  has_many :dataset_configs

  def self.all(repository = nil, *args)
    if repository
      return self.where("repository_id = ? AND visibility > ?",repository,0)
    else
      return super()
    end
  end

  def name
  	#return (abs_path.split('/')[-2] + '/' + abs_path.split('/')[-1])
    return (self.alias)
  end

  def full_name
    return (abs_path.split('/')[-2] + '/' + abs_path.split('/')[-1])
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

  #def visible
  #  @visible = DatasetVisibility.find_by_dataset_name(self.full_name)
  #  if @visible
  #    return @visible.visible
  #  else
  #    return false
  #  end
  #end

  def hide
    @visible = self.visibility
    if @visible == 0
      return true
    else
      return false
    end
  end

  def visible
    @visible = self.visibility
    if @visible == 1 or @visible == 2
      return true
    else
      return false
    end
  end
end
