ActionController::Routing::Routes.draw do |map|

	map.resources :pages, :collection => { 
		:all => :get,
		:translate => :get,
		:order => :post }

	map.resources :locales, :only => :show

end
