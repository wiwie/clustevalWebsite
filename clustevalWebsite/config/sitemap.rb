require 'rubygems'
require 'sitemap_generator'


# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://clusteval.mpi-inf.mpg.de"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add '/1/mains/comparison'
  add programs_path(1)
  add datasets_path(1)
  add clustering_quality_measures_path(1)
  add submits_path(1)
  add admins_path(1)
  add helps_path(1)
  add aboutus_path(1)
end
