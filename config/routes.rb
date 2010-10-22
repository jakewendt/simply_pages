ActionController::Routing::Routes.draw do |map|

	map.resources :pages, :collection => { 
		:translate => :get,
		:order => :post }

	map.resources :locales, :only => :show

end
