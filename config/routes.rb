ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  map.connect '/search/tag/:tag' , :controller => "search", :action => "tag"


  map.connect '', :controller => 'folder'


  #map.connect '/', :controller => 'browse'
  # Dave: commenting this out to test browse controller
  #map.connect '/', :controller => 'folder', :action => "test_index"

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'
  
  # This route helps determine if it's a folder or a file that is
  # being added/remove to/from the clipboard.
  map.connect 'clipboard/:action/:folder_or_file/:id',
              :controller => 'clipboard',
              :requirements => { :action         => /(add|remove)/,
                                 :folder_or_file => /(folder|file)/ }

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
