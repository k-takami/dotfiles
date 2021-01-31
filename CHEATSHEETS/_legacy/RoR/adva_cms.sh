#rails2.3.2 最後リリースのADVA0.2.0インストール
  rails 2ch2 -m  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/templates/adva-cms.0.2.0.rb
#rails2.3.2 最後リリースのADVA0.2.0 で めだったplugin
  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/safemode/README.markdown
  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/has_options/lib/has_options.rb
  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/has_filter/lib/has_filter/filter.rb
  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/has_filter/lib/has_filter.rb
  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/filtered_column/README
  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_calendar/vendor/plugins/later_dude/README
  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_newsletter/vendor/gems/cronedit-0.3.0/lib/cronedit.rb
  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_spam/vendor/plugins/viking/Readme.txt


#adva-cms Know-how-----------------------------------------------------------------------------------------------------------------
    #installation: follow the README.doc
    rake adva:install:core
    sudo rake adva:install engines=adva_theme,adva_assets
    sudo rake db:migrate
    #engines
      #adva-wiki
        post comment[s]
        MethodError in CommentsController#create
        undefined method `wiki_content_path' for #<CommentsController:0xb5163c34>
        RAILS_ROOT: /home/you/RoRapps/2chnrg
        Application Trace | Framework Trace | Full Trace
    #you@ecolnux:~/RoRapps/2chnrg$ rake adva:uninstall engines=blog

    #buggy
      redirection to previous page after login page does not work well. it makes a user being rejected login. but turns out successrful login only when the user goes to the root directory(ie., top page of the website)
