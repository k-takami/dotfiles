{Pentabarf}

Search:]> 
Search

  * Login

  * Preferences

  * About Trac

  * Timeline

  * Browse Source

  * View Tickets

  * Search

  * Roadmap



Context Navigation
------------------

  * Last Change

  * Annotate

  * Revision Log

------------------------------------------------------------------------------------------------------------------------------------------------



root/trunk/rails/config/routes.rb @ 6084


View revision:]> 6084

Visit:[                 ] Go!

Revision 6084, 2.9 KB (checked in by sven, 3 months ago)

add nicer route for xml controller

Line
1 ActionController::Routing::Routes.draw do |map|
2 # The priority is based upon order of creation: first created -> highest priority.
3
4 # Sample of regular route:
5 # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
6 # Keep in mind you can assign values other than :controller and :action
7
8 # Sample of named route:
9 # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
10 # This route can be invoked with purchase_url(:id => product.id)
11
12 # You can have the root of your site routed by hooking up ''
13 # -- just remember to delete public/index.html.
14 map.connect '', :controller => 'pentabarf'
15
16 map.connect 'schedule/:conference', :controller => 'schedule', :action => 'index', :language => 'en'
17 map.connect 'schedule/:conference/index.:language.html', :controller => 'schedule', :action => 'index'
18 map.connect 'schedule/:conference/day/:id.:language.html', :controller => 'schedule', :action => 'day'
19 map.connect 'schedule/:conference/speakers.:language.html', :controller => 'schedule', :action => 'speakers'
20 map.connect 'schedule/:conference/speaker/:id.:language.html', :controller => 'schedule', :action => 'speaker'
21 map.connect 'schedule/:conference/events.:language.html', :controller => 'schedule', :action => 'events'
22 map.connect 'schedule/:conference/event/:id.:language.html', :controller => 'schedule', :action => 'event'
23 map.connect 'schedule/:conference/day/:id.:language.html', :controller => 'schedule', :action => 'day'
24 map.connect 'schedule/:conference/track/:track/index.:language.html', :controller => 'schedule', :action => 'track_events'
25 map.connect 'schedule/:conference/track/:track/:id.:language.html', :controller => 'schedule', :action => 'track_event'
26 map.connect 'schedule/:conference/style.css', :controller => 'schedule', :action => 'css'
27 map.connect 'schedule/:conference/:action.:language.html',:controller => 'schedule'
28 map.connect 'schedule/:conference/:action/:id.:language.html',:controller => 'schedule'
29
30 map.connect 'feedback/:conference/style.css',:controller => 'feedback', :action => 'css'
31 map.connect 'feedback/:conference/:action/:id.:language.html',:controller => 'feedback'
32
33 map.connect 'submission/:conference/:action/:id', :controller => 'submission'
34
35 map.connect 'image/:action/:id.:size.:extension', :controller=> 'image'
36 map.connect 'image/:action/:id.:size', :controller=> 'image'
37
38 map.connect 'ical/:action/:conference', :controller=> 'ical'
39 map.connect 'xcal/:action/:conference', :controller=> 'xcal'
40 map.connect 'xml/:action/:conference', :controller=> 'xml'
41
42 map.connect 'pentabarf/events_by_state/:event_state', :controller => 'pentabarf', :action => 'events_by_state'
43 map.connect 'pentabarf/events_by_state/:event_state/:event_state_progress', :controller => 'pentabarf', :action => 'events_by_state'
44
45 # Install the default route as the lowest priority.
46 map.connect ':controller/:action/:id.:format'
47 map.connect ':controller/:action/:id'
48 end

Note: See TracBrowser for help on using the browser.

View changes...



Download in other formats:
^^^^^^^^^^^^^^^^^^^^^^^^^^

  * Plain Text

  * Original Format

------------------------------------------------------------------------------------------------------------------------------------------------

{Trac Powered}

Powered by Trac 0.12dev-r7890
By Edgewall Software.

Pentabarf



Module
ActionController::Routing

In: vendor/rails/actionpack/lib/action_controller/routing/builder.rb vendor/rails/actionpack/lib/action_controller/routing/optimisations.rb
vendor/rails/actionpack/lib/action_controller/routing/recognition_optimisation.rb vendor/rails/actionpack/lib/action_controller/routing/route.rb
vendor/rails/actionpack/lib/action_controller/routing/route_set.rb vendor/rails/actionpack/lib/action_controller/routing/segments.rb
vendor/rails/actionpack/lib/action_controller/routing.rb



Routing
-------

The routing module provides URL rewriting in native Ruby. It‘s a way to redirect incoming requests to controllers and actions. This replaces
mod_rewrite rules. Best of all, Rails’ Routing works with any web server. Routes are defined in config/routes.rb.

Consider the following route, installed by Rails when you generate your application:

~>
    map.connect ':controller/:action/:id'
  
<~

This route states that it expects requests to consist of a :controller followed by an :action that in turn is fed some :id.

Suppose you get an incoming request for /blog/edit/22, you‘ll end up with:

~>
    params = { :controller => 'blog',
               :action     => 'edit',
               :id         => '22'
            }
  
<~

Think of creating routes as drawing a map for your requests. The map tells them where to go based on some predefined pattern:

~>
    ActionController::Routing::Routes.draw do |map|
      Pattern 1 tells some request to go to one place
      Pattern 2 tell them to go to another
      ...
    end
  
<~

The following symbols are special:

~>
    :controller maps to your controller name
    :action     maps to an action with your controllers
  
<~

Other names simply map to a parameter as in the case of :id.



Route priority
--------------

Not all routes are created equally. Routes have priority defined by the order of appearance of the routes in the config/routes.rb file. The
priority goes from top to bottom. The last route in that file is at the lowest priority and will be applied last. If no route matches, 404 is
returned.

Within blocks, the empty pattern is at the highest priority. In practice this works out nicely:

~>
    ActionController::Routing::Routes.draw do |map|
      map.with_options :controller => 'blog' do |blog|
        blog.show '',  :action => 'list'
      end
      map.connect ':controller/:action/:view'
    end
  
<~

In this case, invoking blog controller (with an URL like ’/blog/’) without parameters will activate the ‘list’ action by default.



Defaults routes and default parameters
--------------------------------------

Setting a default route is straightforward in Rails - you simply append a Hash at the end of your mapping to set any default parameters.

Example:

~>
    ActionController::Routing:Routes.draw do |map|
      map.connect ':controller/:action/:id', :controller => 'blog'
    end
  
<~

This sets up blog as the default controller if no other is specified. This means visiting ’/’ would invoke the blog controller.

More formally, you can include arbitrary parameters in the route, thus:

~>
    map.connect ':controller/:action/:id', :action => 'show', :page => 'Dashboard'
  
<~

This will pass the :page parameter to all incoming requests that match this route.

Note: The default routes, as provided by the Rails generator, make all actions in every controller accessible via GET requests. You should
consider removing them or commenting them out if you‘re using named routes and resources.



Named routes
------------

Routes can be named with the syntax map.name_of_route options, allowing for easy reference within your source as name_of_route_url for the full
URL and name_of_route_path for the URI path.

Example:

~>
    # In routes.rb
    map.login 'login', :controller => 'accounts', :action => 'login'
  
    # With render, redirect_to, tests, etc.
    redirect_to login_url
  
<~

Arguments can be passed as well.

~>
    redirect_to show_item_path(:id => 25)
  
<~

Use map.root as a shorthand to name a route for the root path "".

~>
    # In routes.rb
    map.root :controller => 'blogs'
  
    # would recognize http://www.example.com/ as
    params = { :controller => 'blogs', :action => 'index' }
  
    # and provide these named routes
    root_url   # => 'http://www.example.com/'
    root_path  # => ''
  
<~

You can also specify an already-defined named route in your map.root call:

~>
    # In routes.rb
    map.new_session :controller => 'sessions', :action => 'new'
    map.root :new_session
  
<~

Note: when using with_options, the route is simply named after the method you call on the block parameter rather than map.

~>
    # In routes.rb
    map.with_options :controller => 'blog' do |blog|
      blog.show    '',            :action  => 'list'
      blog.delete  'delete/:id',  :action  => 'delete',
      blog.edit    'edit/:id',    :action  => 'edit'
    end
  
    # provides named routes for show, delete, and edit
    link_to @article.title, show_path(:id => @article.id)
  
<~



Pretty URLs
-----------

Routes can generate pretty URLs. For example:

~>
    map.connect 'articles/:year/:month/:day',
                :controller => 'articles',
                :action     => 'find_by_date',
                :year       => /\d{4}/,
                :month      => /\d{1,2}/,
                :day        => /\d{1,2}/
  
<~

Using the route above, the URL "localhost:3000/articles/2005/11/06" maps to

~>
    params = {:year => '2005', :month => '11', :day => '06'}
  
<~



Regular Expressions and parameters
----------------------------------

You can specify a regular expression to define a format for a parameter.

~>
    map.geocode 'geocode/:postalcode', :controller => 'geocode',
                :action => 'show', :postalcode => /\d{5}(-\d{4})?/
  
<~

or, more formally:

~>
    map.geocode 'geocode/:postalcode', :controller => 'geocode',
                :action => 'show', :requirements => { :postalcode => /\d{5}(-\d{4})?/ }
  
<~

Formats can include the ‘ignorecase’ and ‘extended syntax’ regular expression modifiers:

~>
    map.geocode 'geocode/:postalcode', :controller => 'geocode',
                :action => 'show', :postalcode => /hx\d\d\s\d[a-z]{2}/i
  
    map.geocode 'geocode/:postalcode', :controller => 'geocode',
                :action => 'show',:requirements => {
                  :postalcode => /# Postcode format
                                  \d{5} #Prefix
                                  (-\d{4})? #Suffix
                                  /x
                }
  
<~

Using the multiline match modifier will raise an ArgumentError. Encoding regular expression modifiers are silently ignored. The match will always
use the default encoding or ASCII.



Route globbing
--------------

Specifying *[string] as part of a rule like:

~>
    map.connect '*path' , :controller => 'blog' , :action => 'unrecognized?'
  
<~

will glob all remaining parts of the route that were not recognized earlier. The globbed values are in params[:path] as an array of path
segments.



Route conditions
----------------

With conditions you can define restrictions on routes. Currently the only valid condition is :method.

  * :method - Allows you to specify which method can access the route. Possible values are :post, :get, :put, :delete and :any. The default value
    is :any, :any means that any method can access the route.

Example:

~>
    map.connect 'post/:id', :controller => 'posts', :action => 'show',
                :conditions => { :method => :get }
    map.connect 'post/:id', :controller => 'posts', :action => 'create_comment',
                :conditions => { :method => :post }
  
<~

Now, if you POST to /posts/:id, it will route to the create_comment action. A GET on the same URL will route to the show action.



Reloading routes
----------------

You can reload routes if you feel you must:

~>
    ActionController::Routing::Routes.reload
  
<~

This will clear all named routes and reload routes.rb if the file has been modified from last load. To absolutely force reloading, use reload!.



Testing Routes
--------------

The two main methods for testing your routes:



assert_routing
^^^^^^^^^^^^^^

~>
    def test_movie_route_properly_splits
     opts = {:controller => "plugin", :action => "checkout", :id => "2"}
     assert_routing "plugin/checkout/2", opts
    end
  
<~

assert_routing lets you test whether or not the route properly resolves into options.



assert_recognizes
^^^^^^^^^^^^^^^^^

~>
    def test_route_has_options
     opts = {:controller => "plugin", :action => "show", :id => "12"}
     assert_recognizes opts, "/plugins/show/12"
    end
  
<~

Note the subtle difference between the two: assert_routing tests that a URL fits options while assert_recognizes tests that a URL breaks into
parameters properly.

In tests you can simply pass the URL or named route to get or post.

~>
    def send_to_jail
      get '/jail'
      assert_response :success
      assert_template "jail/front"
    end
  
    def goes_to_login
      get login_url
      #...
    end
  
<~



View a list of all your routes
------------------------------

Run rake routes.

Methods

  * controller_relative_to

  * inflections_with_route_reloading

  * normalize_paths

  * possible_controllers

  * use_controllers!

  * with_controllers

Classes and Modules

Module ActionController::Routing::Helpers
Module ActionController::Routing::Optimisation
Class ActionController::Routing::OptionalFormatSegment
Constants

SEPARATORS = %w( / . ? )
HTTP_METHODS = [:get, :head, :post, :put, :delete]
ALLOWED_REQUIREMENTS_FOR_OPTIMISATION = [:controller, :action].to_set
Routes = RouteSet.new

Public Class methods

controller_relative_to(controller, previous)

Returns a controller path for a new controller based on a previous controller path. Handles 4 scenarios:

  * stay in the previous controller:
    ~>
        controller_relative_to( nil, "groups/discussion" ) # => "groups/discussion"
      
<~

  * stay in the previous namespace:
    ~>
        controller_relative_to( "posts", "groups/discussion" ) # => "groups/posts"
      
<~

  * forced move to the root namespace:
    ~>
        controller_relative_to( "/posts", "groups/discussion" ) # => "posts"
      
<~

  * previous namespace is root:
    ~>
        controller_relative_to( "posts", "anything_with_no_slashes" ) # =>"posts"
      
<~

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 363
  363:       def controller_relative_to(controller, previous)
  364:         if controller.nil?           then previous
  365:         elsif controller[0] == ?/    then controller[1..-1]
  366:         elsif %r{^(.*)/} =~ previous then "#{$1}/#{controller}"
  367:         else controller
  368:         end
  369:       end
  
<~

normalize_paths(paths)

Returns an array of paths, cleaned of double-slashes and relative path references.

  * "\\" and "//" become "\" or "/".

  * "/foo/bar/../config" becomes "/foo/config".

The returned array is sorted by length, descending.

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 299
  299:       def normalize_paths(paths)
  300:         # do the hokey-pokey of path normalization...
  301:         paths = paths.collect do |path|
  302:           path = path.
  303:             gsub("//", "/").           # replace double / chars with a single
  304:             gsub("\\\\", "\\").        # replace double \ chars with a single
  305:             gsub(%r{(.)[\\/]$}, '\1')  # drop final / or \ if path ends with it
  306: 
  307:           # eliminate .. paths where possible
  308:           re = %r{[^/\\]+[/\\]\.\.[/\\]}
  309:           path.gsub!(re, "") while path.match(re)
  310:           path
  311:         end
  312: 
  313:         # start with longest path, first
  314:         paths = paths.uniq.sort_by { |path| - path.length }
  315:       end
  
<~

possible_controllers()

Returns the array of controller names currently available to ActionController::Routing.

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 318
  318:       def possible_controllers
  319:         unless @possible_controllers
  320:           @possible_controllers = []
  321: 
  322:           paths = controller_paths.select { |path| File.directory?(path) && path != "." }
  323: 
  324:           seen_paths = Hash.new {|h, k| h[k] = true; false}
  325:           normalize_paths(paths).each do |load_path|
  326:             Dir["#{load_path}/**/*_controller.rb"].collect do |path|
  327:               next if seen_paths[path.gsub(%r{^\.[/\\]}, "")]
  328: 
  329:               controller_name = path[(load_path.length + 1)..-1]
  330: 
  331:               controller_name.gsub!(/_controller\.rb\Z/, '')
  332:               @possible_controllers << controller_name
  333:             end
  334:           end
  335: 
  336:           # remove duplicates
  337:           @possible_controllers.uniq!
  338:         end
  339:         @possible_controllers
  340:       end
  
<~

use_controllers!(controller_names)

Replaces the internal list of controllers available to ActionController::Routing with the passed argument.

~>
    ActionController::Routing.use_controllers!([ "posts", "comments", "admin/comments" ])
  
<~

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 344
  344:       def use_controllers!(controller_names)
  345:         @possible_controllers = controller_names
  346:       end
  
<~

with_controllers(names) {|| ...}

Expects an array of controller names as the first argument. Executes the passed block with only the named controllers named available. This
method is used in internal Rails testing.

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 287
  287:       def with_controllers(names)
  288:         prior_controllers = @possible_controllers
  289:         use_controllers! names
  290:         yield
  291:       ensure
  292:         use_controllers! prior_controllers
  293:       end
  
<~

Public Instance methods

inflections_with_route_reloading(&block)

Ensures that routes are reloaded when Rails inflections are updated.

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 376
  376:       def inflections_with_route_reloading(&block)
  377:         returning(inflections_without_route_reloading(&block)) {
  378:           ActionController::Routing::Routes.reload! if block_given?
  379:         }
  380:       end
  
<~

