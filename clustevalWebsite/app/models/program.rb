class Program < ActiveRecord::Base
  belongs_to :repository

  #def to_param
  #    return self.full_name.gsub('/','_')
  #end

  def self.all(repository, *args)
  if repository
    return self.find(:all, :conditions => ["repository_id = ?",repository])
  else
    return super.all
  end
  end

  def name
    return self.alias
  end

  def full_name
  	return (abs_path.split('/')[-2] + '/' + abs_path.split('/')[-1])
  end

  def imageUrl
    @image = ProgramImage.find_by_program_fullName(self.full_name)
    if @image
      return @image.program_imageUrl
    else
      return nil
    end
  end

  def description
    @descr = ProgramDescription.find_by_program_fullName(self.full_name)
    if @descr
      return @descr.program_description
    else
      return nil
    end
  end

  def publication
    @pub = ProgramPublication.find_by_program_fullName(self.full_name)
    if @pub
      return @pub.program_publication
    else
      return nil
    end
  end

  def publicationUrl
    @pub = ProgramPublication.find_by_program_fullName(self.full_name)
    if @pub
      return @pub.program_publicationUrl
    else
      return ''
    end
  end
end