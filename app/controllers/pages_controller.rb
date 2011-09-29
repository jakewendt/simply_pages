class PagesController < ApplicationController

	before_filter :login_required

	#	calnet_authenticated
	skip_before_filter :login_required, 
		:only => [:show, :translate]

#	removed method
#	skip_before_filter :build_menu_js, 
#		:only => [:translate]

	#	simply_authorized
	before_filter :may_maintain_pages_required, 
		:except => [:show, :translate]

	before_filter :id_required, :only => [ :edit, :update, :destroy ]
	before_filter :page_required, :only => :show
#	removed method
#	before_filter :build_submenu_js, :except => [:index, :order, :translate]

#	caches partials from layout as well, which is too much
#	caching still buggy
#	if do cache layout, contains user links
#	if don't cache layout, submenu goes missing

#	caches_action saves to memory
#	caches_page generates an actual file in public/
#	it would probably require modifications to the
#	page_sweeper's expire calls

	#	This will also cache the flash output so don't cache layout
	caches_action :show, :layout => false

#	caches_page :show	#, :layout => false
	cache_sweeper :page_sweeper, :only => [:create, :update, :order, :destroy]

	ssl_allowed :show, :translate

	def order
#		params[:pages].reverse.each { |id| Page.find(id).move_to_top }
#	this doesn't even check for parents or anything
#	making it faster, but potentially error prone.

		if params[:pages] && params[:pages].is_a?(Array)
			params[:pages].each_with_index { |id,index| 
				Page.find(id).update_attribute(:position, index+1 ) }
		else
			flash[:error] = "No page order given!"
		end
		redirect_to pages_path(:parent_id=>params[:parent_id])
	end

	def translate
		respond_to do |format|
			format.js {}
		end
	end
		
	def show
	end

	def all
		@page_title = "All CCLS Pages"
		@pages = Page.all
	end

	def index
		@page_title = "CCLS Pages"
		params[:parent_id] = nil if params[:parent_id].blank?
		@pages = Page.all(:conditions => { :parent_id => params[:parent_id] })
	end

	def new
		@page_title = "Create New CCLS Page"
		@page = Page.new(:parent_id => params[:parent_id])
	end

	def edit
		@page_title = "Edit CCLS Page #{@page.title(session[:locale])}"
	end

	def create
		@page = Page.new(params[:page])
		@page.save!
		flash[:notice] = 'Page was successfully created.'
		redirect_to(@page)
	rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved
		flash.now[:error] = "There was a problem creating the page"
		render :action => "new"
	end

	def update
		@page.update_attributes!(params[:page])
		flash[:notice] = 'Page was successfully updated.'
		redirect_to(@page)
	rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved
		flash.now[:error] = "There was a problem updating the page."
		render :action => "edit"
	end

	def destroy
		@page.destroy
		redirect_to(pages_path)
	end

protected

	def id_required
		if !params[:id].blank? and Page.exists?(params[:id])
			@page = Page.find(params[:id])
		else
			access_denied("Valid page id required!", pages_path)
		end
	end

	#	Put this in a separate before_filter so that
	#	another before_filter can access @page
	def page_required
		if params[:path]
 			@page = Page.by_path("/#{params[:path].join('/')}")
			raise ActiveRecord::RecordNotFound if @page.nil?
		else
			@page = Page.find(params[:id])
		end
		@page_title = @page.title(session[:locale])
		if @page.is_home? && class_exists?('HomePagePic')
			@hpp = HomePagePic.random_active()
		end
	rescue ActiveRecord::RecordNotFound
		flash_message = "Page not found with "
		flash_message << (( params[:id].blank? ) ? "path '/#{params[:path].join('/')}'" : "ID #{params[:id]}")
		flash.now[:error] = flash_message
	end

#	def build_submenu_js
#		if @page && !@page.root.children.empty?
#			js = "" <<
#				"if ( typeof(translatables) == 'undefined' ){\n" <<
#				"	var translatables = [];\n" <<
#				"}\n"
#			js << "tmp={tag:'#current_root',locales:{}};\n"
#			%w( en es ).each do |locale|
#				js << "tmp.locales['#{locale}']='#{@page.root.menu(locale)}'\n"
#			end
#			js << "translatables.push(tmp);\n"
#			@page.root.children.each do |child|
#				js << "tmp={tag:'#menu_#{dom_id(child)}',locales:{}};\n"
#				%w( en es ).each do |locale|
#					js << "tmp.locales['#{locale}']='#{child.menu(locale)}'\n"
#				end
#				js << "translatables.push(tmp);\n"
#			end
#			@template.content_for :head do
#				@template.javascript_tag js
#			end
#		end
#	end

end
