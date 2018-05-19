Pathfinder is a software development firm. Hire us to build complex software that's easy to use.

Pathfinder Development

  • home
  • about
  • services
  • clients
  • showcase
  • ideas
  • blogs

Contact Us Now Toll free 866.882.7215

How to use will_paginate with non-ActiveRecord collection/array

Sharad Jain, Friday, June 6, 2008 @ 4:04 pm

will_paginate is very well designed plugin. Besides ActiveRecord object integration, it can integrate with array and any collection
that you may have. The README.rdoc (in version 2.2.2) and wiki clearly and concisely document how to use it with ActiveRecord objects.
I recently needed to use it for a collection outside of activerecord and here is how I did it.

My input params supplied the current page and the per_page. So, I had

current_page = params[:page]
per_page = params[:per_page] # could be configurable or fixed in your app

1) Fetch your collection:
In case of ActiveRecord object, we would do:

@posts = Post.paginate :page =&gt; params[:page], :per_page =&gt; 50

In case of non-ActiveRecord, the onus is still on us to fetch just the records that we need. If we can't and we need to work with full
collection, will_paginate doesn't mind. So, here we go...

# Non-ActiveRecord Post
@posts = Post.perform_search_and_obtain_collection(params[:criteria])

2) IMP*: Create an instance of WillPaginate::Collection class.

@page_results = WillPaginate::Collection.create(current_page, per_page, @results.total_results) do |pager|
   pager.replace(@posts.to_array)
end

WillPaginate::Collection extends Array class and added properties like @current_page, @per_page, @total_entries etc. We pass the
current_page, per_page properties in constructor and we replace the array contents by converting our @posts to an array
(@posts.to_array). This is assuming that @posts contains only the collection for current-page. If @post contains _all_ results, then we
can do following:

@page_results = WillPaginate::Collection.create(current_page, per_page, @results.total_results) do |pager|
  start = (current_page-1)*per_page # assuming current_page is 1 based.
  pager.replace(@posts.to_array[start, per_page])
end

If our search results were already an array, then it is even easier. All we do is:

@page_results = @posts.paginate(params[:current_page], params[:per_page])

Yes, the plugin adds a method "paginate" to Array class.

Once we have an instance of WillPaginate::Collection object, it behaves exactly same as the one we normally obtain from
ActiveRecord.paginate() function. So, we can continue to do this in viewer:

<ol>
<% for post in @page_results -%>
<li>Render `results` in some nice way.</li>
<% end -%>
</ol>

<p>Now let's render us some pagination!</p>
<%= will_paginate @page_results %>

Also, I encourage you to peek into the source code. I found paginated_section that renders pagination stuff at the top/bottom of page.

<% paginated_section @posts do %>
<ol id="posts">
<% for post in @posts %>
<li> ... </li>
<% end %>
</ol>
<% end %>

Even the rendering is done using a pluggable class, incase if you want to render page links differently.

Related posts:

 1. ActiveRecord create_or_update based on natural-key
 2. acts_without_database: Leverage ActiveRecord with Non-Database Backed Objects
 3. Mass Assigning Inheritance Column Values for ActiveRecord STI with Rails
 4. On Beyond Zebra: When ActiveRecord Isn’t Enough
 5. activerecord tests: modify activerecord logging without tripping rollback convenience

Topics: activerecord, pagination, Ruby on Rails, will_paginate

Comments (7)
tech development Tech Development

Comments: 7 so far

  • Leave a comment
  • Comment feed for this post
  • TrackBack URL

 1. [01588]

    Thanks this is exactly what I need.

    Comment by Daniel Lucraft, Thursday, August 28, 2008 @ 7:28 am

 2. [beb23]

    Thank you so much. I googled for a whole day, and eventually I found your post. And your method solved all the problems I need to
    tack! Cheer!

    Comment by boblu, Thursday, September 11, 2008 @ 8:57 pm

 3. [9f9c3]

    Yeah I looked for hours before finding this. And it was just what I needed. Thanks alot

    Comment by Iain, Tuesday, October 7, 2008 @ 4:11 am

 4. [db402]

    Am I the only one getting the exception: Wrong number of arguments (2 for 1) trying this:

    @page_results = @posts.paginate(params[:current_page], params[:per_page])

    Thanks! :)

    Comment by shawn, Wednesday, November 26, 2008 @ 8:14 pm

 5. [db402]

    Found it:

    http://mislav.uniqpath.com/static/will_paginate/doc/

    2.2.0, released 2008-04-07 API changes

    Remove old, deprecated style of calling Array#paginate as “paginate(page, per_page)”.

    If you want to specify :page, :per_page or :total_entries, use a parameter hash.

    Comment by shawn, Wednesday, November 26, 2008 @ 8:16 pm

 6. [f0b29]

    hey guys, nice post. i using rails to build a client which only consumes restful webservice with activeresource, so i deactivated
    activerecord. i’m getting an array of activeresource object limited by :page and :per_page an so on. if i try to call will_paginate
    @results in the view it gives me an NoMethodError. In the controller i’m using that WillPaginate::Collection.create(…) and it
    doesn’t complain. but if i activate activerecord everything works. how can i say will_paginate not to be dependent on activerecord
    :D do i really have to patch it myself?

    Comment by s!ck, Wednesday, February 11, 2009 @ 6:41 pm

 7. [f5ca8]

    Thanks works like a charm. I used the way you describe here

    Comment by amit, Thursday, April 9, 2009 @ 5:32 pm

Leave a comment

Name (required) [                    ] Email address (required) [                    ] This will never be published Website
[                    ] Must begin with "http://" Comment text [                    ] [submit]

Powered by WP Hashcash

Wordpress Hashcash needs javascript to work, but your browser has javascript disabled. Your comment will be queued in Akismet!
« Next Post Blog Home Previous Post »

Best Practices Newsletter

    Get a monthly update on best practices for delivering successful software.

    Subscribe via email

    [                    ]    [subscribe]

    Subscribe via RSS      RSS icon

Categories

  • .NET
  • Agile Project Management
  • Ajax
  • Business Rules
  • Custom Application Development
  • Flash Platform
  • iPhone/Mobile
  • Java
  • Pathfinder News
  • Product Strategy
  • Rich Internet Apps
  • Ruby on Rails
  • Social Applications
  • Software Development
  • TechDev
  • User Experience
  • Web Infrastructure

Topics

.NET .NET Browser Control 2d physics 3d 3D GPS 3D physics 37signals Acceptance Tests Accessibility ActionMailer actionscript
activerecord acts_as_ferret Add new tag Adium ADO.NET Entity Framework Adobe Adobe AIR adobe flex Adobe Illustrator Advertising
aggregation agile Agile Development agile iteration agile thinking AIR Ajax Ajax Applications Ajax Bookmarking Ajax Components Ajax
Development Ajax Examples Ajax Experience Ajax Frameworks Ajax history management Ajax Intervention Ajax libraries Ajax library AJAX
Obfuscation Ajax Performance Ajax Products Ajax toolkit Ajax Tools Ajax Widgets A list apart Amazon Amazon CDN Amazon Web Services amf
Analysis Android animation Announcement Announcements antennae Antipatterns Apache Apollo apple Application Architecture Application
Development architecture AS3 ask a UI guy ASP.NET ASP.NET asterisk Asynchronous Processing authorization awards axiis Azure Back Button
backups bandwidth bandwidth profiling Beans beer Benchmarking Best Practices BitmapData.draw BJAX blackberry Blaze Advisor blender blog
blogging book review Books braindump browser Browsers Bugs Business Business Reasons for Ajax Business Rules C# caching campfire Canvas
capistrano Case Studies CFO Charles checklist chess Chesspresso Chicago chicagoruby chirb windycityrails Chrome Chrome OS CIO Cloud
Computing CloudFront CMS COBOL Cocoa code code art Code Generation code generator Color COMET Computer Science Conference Confluence
Consistency Content Management continuous integration converget appliances core animation CRM cruise CruiseControl CSS cucumber Custom
Application Development Custom Flex Component dashboard Data Mapper data services integration data visualization Degrafa deployment
deprec Design Design Patterns design thinking Desktop Desktop RIA Desktop Software Developer's Notebook development DHTML Diagnose
documentation Dojo Domain Knowledge don norman Drools drupal dynamic languages ease of use EC2 Echo2 Echo3 Editorial Entrepreneur erb
ERP Estimating estimation Ethnographic Research events everyblock Excel externalinterface Ext JS Extreme Programming eye tracking
Facebook factory Feedback Loop ferret FileReference Firebug Firefox Firefox Extensions fixturereplacement fixture replacement fixtures
Flare Flash flash awards Flash Platform flash player flash player 10 Flash Player optimization Flash Remoting Flex Flex3 flex code
generator flex css flexmock Flex optimization flex skins flexunit Flickr Flock Flow Fluent forms Frameworks FriendFeed front end front
end development fulltext search functional functional specs Games Gauge Component gem getting things done ghost Git github gitignore
Golf Google Google Analytics Google Analytics for Flash Google Analytics for Flex google android Google calendar google docs Google
Gadgets Google Gears google maps GORM government g phone Grails Graphics Greasemonkey Groovy GStreamer GTD Gwittir GWT h.264 haml
hardware Healthcare heuristic evaluation Hibernate hosting HTML Hudson IBM IDE Ideation IE IE6 IE7 IE8 IE detection iGoogle illustrator
cs3 ILog ILOG JRules imacros importing graphics to flex Information Architecture information visualization infrastructure Innovation
Instructional Design Interaction Design interaction patterns design Internship Interview iPhone iPhone SDK iPod irb iteration IT Mill
Toolkit iTunes jakob nielson Java javafx Javascript JavaScript frameworks Javascript Libraries JBoss Rules Jess Jetty JIT jmeter Jobs
jQuery JSF JSON JSP JSR-94 JsUnit laptop Lazlo Legacy Systems leopard lightweight LinkedIn LINQ LINUX logging Logical Model and
Conceptual Model Low Pro Mac Malware mapping Mash Note Mashups math Meebo metal metaprogramming MetaWidget Methodology Microformats
microsite Microsoft migrations minimalism Mobile mobile platform mocking mock objects modeling mod_rails monitoring Mootools mouse
mouse scroll mouse wheel Mozilla Music MVC MySql natural key neal ford Netbook NetNewsWire networking news newspapers nfjs NHibernate
nokia notebook NSURLProtocol obj-c Object-Oriented Objective-C Object Relation Mapping (ORM) ocmock Office OmniGraffle online
spreadsheets OOAD OOP opengl Open Screen OpenSocial opensource Open Source Opera Oracle OReilly origami ORM OS X osx pagination pairing
Pair Programming palm papervision3d Pathfinder Development Patterns pdf Peer Creation Performance Personas PGN PHP Phusion Passenger
physics physics engines planning plugin plugins portableapps pragmatic prawn Predictions preloader primary key privacy process Web/Tech
Product Definition Production Support productive programer productivity product launch Product Strategy Progressive Enhancement project
concept Project Manage project management Project Website Prototype Prototyping Pure MVC PureMVC PV3D pyro QA qooxdoo Radiant CMS rails
railscasts Rails Environment Tests railsrx rails testing Really Simple History Refactor refactoring References regex regular
expressions reporting Requirements Requirements Alice Toth Requirements Visualization resesign Restlet RETE Review rfp ria Rich
Interactions rich internet applicaiton rich internet applications ROI rspec ruby rubyamf Ruby on Rails Ruby on Rails testing role
ruport S3 SaaS Safari San Francisco Scalability Scenarios Scriptaculous Scrum SDLC Search Secretariat Security Selenium SeleniumIDE
Semantic web SEO Server Side service oriented architecture shoulda Silverlight simplicity Sketch skins SOA soapUI Social Networking
software develoment Software Development Software Engineering Software Processes Songbird SpiderMonkey Sprajax Spreadsheets
StageScaleMode Standards standish starting projects Startups static typing Stencils STI Story Telling Structured Design Struts sun
surrogate key Swing tabs tag taglib Tamarin Tank Engine Task Flows tdd teams teamwork telephony Tellurium Test test::unit Test Driven
Development Testing tether textmate The Ajax Experience throttling Tilt Component Tools touch screen kiosk TraceMonkey Training Trends
Tumblr Tutorial Tutorials Twitter ubuntu UI UIViewController uml unit testing Unit Tests unity3d Usability Usability Testing user
driven agile User Experience user experience design user groups user interface User Interface Standards User Research UXD value Venture
Capital Video viral marketing Vision visual analytics visual design visual documentation Visualization VLC VML vmware Volta waterfall
watij watir web Web/Tech Web 2.0 web app Web Design Web Development web forms web hosting Web Infrastructure Webkit Weblogs Web
Services WebSockets Web Standards WebTest Widgets will_paginate Windows windows development windows mobile WinForms Wireframes
WordPress workflow work life balance xcode XML XML Metadata xp XUL Yahoo Map AS3 API YUI Zeigarnik Zeigarnik Effect ZendAMF ZK

Archives

  • August 2009
  • July 2009
  • June 2009
  • May 2009
  • April 2009
  • March 2009
  • February 2009
  • January 2009
  • December 2008
  • November 2008
  • October 2008
  • September 2008
  • August 2008
  • July 2008
  • June 2008
  • May 2008
  • April 2008
  • March 2008
  • February 2008
  • January 2008
  • December 2007
  • November 2007
  • October 2007
  • September 2007
  • August 2007
  • July 2007
  • June 2007
  • May 2007
  • April 2007
  • March 2007
  • February 2007
  • January 2007
  • December 2006
  • November 2006
  • October 2006
  • September 2006
  • August 2006
  • July 2006
  • June 2006
  • May 2006
  • April 2006
  • March 2006

Blogroll

  • Ajax Patterns
  • Ajaxian
  • Paul Graham

Recent

  • Rails Testing First Look: Blue Ridge
  • Developing Good Wireframes Ahead of Visual Design
  • Software Development and the Construction Analogy
  • Rails Test Prescriptions to be Published by Pragmatic
  • Javascript debugging and testing in the wild (Prototype bug when using array.flatten in IE)
  • UI Views – Include or Exclude from Code Coverage
  • Ten Keys to Successful Software Development: #9: Respect the Process
  • Don’t be lazy, download a good browser
  • Exactly What are Wireframes?
  • Separating Reporting Environments In Production

Search

    [               ] [Search]

WordPress

  • Log in

  • All Posts
  • Software Development
  • RIAs
  • iPhone/Mobile
  • Pathfinder News
  • Website

  • Chicago Office
  • New York Office

  • about blog
  • email & rss feeds
  • topics & tags
  • archives

Copyright © 1998-2009 Pathfinder Development LLC
Comments about this site: info@pathf.com
