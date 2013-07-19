module SermonsHelper
	def active_sermon_sidebar_link?( path )
		"active" if current_page?( path )
	end
end
