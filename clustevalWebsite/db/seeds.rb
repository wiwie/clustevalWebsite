# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
RepositoryType.create([
	{name: 'Repository'}, 
	{name: 'RunResultRepository'}])
RunType.create([
	{name: 'Clustering'},
	{name: 'Data Analysis'},
	{name: 'Internal Parameter Optimization'},
	{name: 'Parameter Optimization'},
	{name: 'Run Analysis'},
	{name: 'Run-Data Analysis'}])
ProgramParameterType.create([
	{name: 'DoubleProgramParameter'},
	{name: 'IntegerProgramParameter'},
	{name: 'StringProgramParameter'}])
ProgramDescription.create([
	{program_fullName: 'TransClust/TransClust.jar', program_description: 'Transitivity Clustering is a clustering method based on the assumption that groupings of the data are defined by hidden transitivities between the data objects. The clustering process consists of transforming a given intransitive similarity graph into a transitive one by adding and removing edges. The idea is to find a (clustering) solution with minimal number of edge modifications for the unweighted case. It can also be applied to weighted graphs, where the cost of a solution is the sum of the edge weights that were added or removed.'},
	{program_fullName: 'APcluster/apcluster', program_description: 'Affinity Propagation "identifies exemplars among data points and forms clusters of data points around these exemplars. It operates by simultaneously considering all data point as potential exemplars and exchanging messages between data points until a good set of exemplars and clusters emerges."'},
	{program_fullName: 'MCL/mcl-12-068', program_description: '"The MCL algorithm is short for the Markov Cluster Algorithm, a fast and scalable unsupervised cluster algorithm for networks (also known as graphs) based on simulation of (stochastic) flow in graphs."'},
	{program_fullName: 'programs/KMeansClusteringRProgram.jar', program_description: 'K-Means iteratively improves k cluster-centers, by minimizing the residual sum of squares between data points and their corresponding cluster means.'},
	{program_fullName: 'programs/SpectralClusteringRProgram.jar', program_description: 'Spectral clustering refers to a class of techniques which transform the input similarity matrix into its eigenspace. Then points are partitioned into disjoint clusters with points in the same cluster having high similarity and points in different clusters having low similarity.'},
	{program_fullName: 'programs/HierarchicalClusteringRProgram.jar', program_description: 'Hierarchical clustering is a class of clustering methods which seek to build a hierarchy of clusters using different linking methods in an agglomerative or divisive manner.'}])
ProgramImage.create([
	{program_fullName: 'TransClust/TransClust.jar', program_imageUrl: 'transclust.png'},
	{program_fullName: 'APcluster/apcluster', program_imageUrl: 'affinity_propagation_messages.png'},
	{program_fullName: 'MCL/mcl-12-068', program_imageUrl: 'markov.png'},
	{program_fullName: 'programs/KMeansClusteringRProgram.jar', program_imageUrl: 'kmeans.png'},
	{program_fullName: 'programs/SpectralClusteringRProgram.jar', program_imageUrl: 'spectral.png'},
	{program_fullName: 'programs/HierarchicalClusteringRProgram.jar', program_imageUrl: 'dendrogram.png'}])
ProgramPublication.create([
	{program_fullName: 'TransClust/TransClust.jar', program_publication: 'Wittkop T, Emig D, Lange SJ, Rahmann S, Albrecht M, Morris JH, Boecker S, Stoye J, Baumbach J (2010) <b>Partitioning biological data with Transitivity Clustering.</b> <i>Nature Methods</i> 2010 Jun;7(6):419-20.', program_publicationUrl: 'http://www.ncbi.nlm.nih.gov/pubmed/20508635'},
	{program_fullName: 'APcluster/apcluster', program_publication: 'Brendan J. Frey and Delbert Dueck (2007) <b>Clustering by Passing Messages Between Data Points.</b> <i>Science</i> 2007 Feb;315:972-976.', program_publicationUrl: 'http://www.sciencemag.org/content/315/5814/972.full'},
	{program_fullName: 'MCL/mcl-12-068', program_publication: 'Stijn van Dongen, <b>Graph Clustering by Flow Simulation.</b> PhD thesis, <i>University of Utrecht</i> 2000 May.', program_publicationUrl: 'http://igitur-archive.library.uu.nl/dissertations/1895620/full.pdf'},
	{program_fullName: 'programs/KMeansClusteringRProgram.jar', program_publication: 'J. A. Hartigan and M. A. Wong. Algorithm as 136: <b>A k-means clustering algorithm.</b> <i>Journal of the Royal Statistical Society.</i> Series C (Applied Statistics), 28(1):pp. 100-108, 1979.', program_publicationUrl: 'http://www.jstor.org/discover/10.2307/2346830'}])
ClusteringQualityMeasureOptimum.create([
	{measure_name: 'AlignedEdgesQualityMeasure', name: 'Maximum'},
	{measure_name: 'EdgeCorrectnessQualityMeasure', name: 'Maximum'},
	{measure_name: 'GraphEditDistanceQualityMeasure', name: 'Minimum'}
	])

DatasetDescription.create([
	{dataset_fullName: 'synthetic/spirals250', dataset_description: 'This synthetic data set consists of 250 two-dimensional data objects, distributed over two entangled spirals. Since the data set is non-convex, it is almost impossible to resolve the natural grouping for clustering methods, that are solely based on an approach maximizing between-cluster distances and minimizing within-cluster distances in the original input space. Therefore, methods that either transform the data into a more suitable space, like Spectral Clustering, or that base their cluster identification on local neighborhood similarities will be able to identify the cluster structure.'},
	{dataset_fullName: 'tcga/all_emc_spearman.txt', dataset_description: 'The Cancer Genome Atlas (TCGA) is a project maintaining a database storing molecular information of cancer cells, including gene expression, DNA methylation or copy number aberration. It includes data for many different cancer types, allowing their comparison on a molecular level. A data set has been derived integrating gene expression levels, DNA methylation and copy number aberration of the three different cancer types, namely Breast Invasive Carcinoma (BRCA, 207 samples), Glioblastoma Multiforme (GBM, 67 samples) and Lung Squamous Cell Carcinoma (LUSC, 19 samples). For each type of molecular information the authors calculated pairwise similarities between the samples using Spearman correlation. This resulted in three similarities for every pair of samples, which were then combined by taking their arithmetic mean.'},
	{dataset_fullName: 'sfld/sfld_brown_et_al_amidohydrolases_protein_similarities_for_beh.txt', dataset_description: 'The data set contains pairwise similarities of blasted sequences of 232 proteins belonging to the amidohydrolase superfamily. A gold standard is provided describing families within the given superfamily. According to the gold standard the amidrohydrolase superfamily contains 29 families.'}
	])
DatasetImage.create([
	{dataset_fullName: 'synthetic/spirals250', dataset_imageUrl: 'spirals1000.png'}
	])
DatasetPublication.create([
	{dataset_fullName: 'tcga/all_emc_spearman.txt', dataset_publication: 'Nora Speicher. <b>Towards the identification of cancer subtypes by integrative clustering of molecular data.</b> Master''s thesis, <i>Universitaet des Saarlandes</i>, December 2012.', dataset_publicationUrl: 'http://domino.mpi-inf.mpg.de/intranet/ag3/ag3publ.nsf/AuthorEditorIndividualView/ae782c8688cc637cc1257b27005442df?OpenDocument'},
	{dataset_fullName: 'sfld/sfld_brown_et_al_amidohydrolases_protein_similarities_for_beh.txt', dataset_publication: 'Shoshana D Brown, John A Gerlt, Jennifer L Seffernick, and Patricia C Babbitt. <b>A gold standard set of mechanistically diverse enzyme superfamilies.</b> <i>Genome Biol, 7(1):R8</i>, 2006.', dataset_publicationUrl: 'http://www.ncbi.nlm.nih.gov/pubmed/16507141'}
	])