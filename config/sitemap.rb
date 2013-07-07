# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://bo-xpucte.ru/"

# Creating index.
SitemapGenerator::Sitemap.create_index = :auto

SitemapGenerator::Sitemap.create do
  I18n.available_locales.each do |locale|
    add root_path( :locale => locale )
    add articles_path( :locale => locale )
    add albums_path( :locale => locale )
    add contacts_path( :locale => locale )
  end

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
end
