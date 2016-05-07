class AddDensitycutRprogram < ActiveRecord::Migration
  def up
	ActiveRecord::Base.connection.execute('INSERT INTO program_descriptions ("program_fullName", program_description) VALUES (\'programs/DensityCutRProgram.jar\', \'densityCut is a novel density-based clustering algorithm, which is both time- and space-efficient. It first roughly estimates the densities of data points from a K-nearest neighbour graph and then refines the densities via a random walk.\')')
	ActiveRecord::Base.connection.execute('INSERT INTO program_publications ("program_fullName", program_publication, "program_publicationUrl") VALUES (\'programs/DensityCutRProgram.jar\', \'Jiarui Ding, Sohrab Shah and Anne Condon. <b>densityCut: an efficient and versatile topologicalapproach for automatic clustering of biological data.</b> <i>Bioinformatics</i>, 2016.\', \'\')')
  end
end
