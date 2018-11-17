$ sudo gem install html2haml haml2slim

#相互変換と運用性
  #RAILSCOMPOSER対応状況
    prefs[:templates] = "haml" #NG hamlにすると、gemの個別変換バグがある。
    # prefs[:templates] = "erb"
    # prefs[:templates] = "slim" #NG: erb2hamlはdevise未対応、haml2slimはthoughtbot administrate 未対応


  # from ERB into SLIM
    NG: $ find . -name \*.erb -print | sed 'p;s/.erb$/.slim/' | xargs -n2 html2slim --delete
      "> <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track' => 'reload' %>
      <%= javascript_include_tag 'application', 'data-turbolinks-track' => 'reload' %>
      <%= csrf_meta_tags %>
      <%= render 'layouts/navigation' %>
      <%= render 'layouts/messages' %>
      <%= yield %>

      #COMPOSERで template: slim にしたあとにslim2htmlで一括変換してもだめ
      Sign up
      <%= devise_error_messages! %>
      <%= f.label :name %> <%= f.text_field :name, :autofocus => true, class: 'form-control' %>
      <%= f.label :email %> <%= f.email_field :email, class: 'form-control' %>
      <%= f.label :password %> <%= f.password_field :password, class: 'form-control' %>
      <%= f.label :password_confirmation %> <%= f.password_field :password_confirmation, class: 'form-control' %>
      <%= f.submit 'Sign up', :class => 'button right' %> <% end %>

  # from ERB into HAML
  find . -name \*.erb -print | sed 'p;s/.erb$/.haml/' | xargs -n2 html2haml --ruby19-attributes
  find . -name \*.erb -print | xargs -n1 rm

  # from HAML into SLIM
  $ find . -name \*.haml -print | sed 'p;s/.haml$/.slim/' | xargs -n2 haml2slim --delete
  NG: role: "main" = render 'layouts/messages' = yield みたくthoughtbot administrateレイアウトをSLIM変換できない。



#HAML
	-debugger
	irbでの検証は以下括弧内にHAML式を代入
		Haml::Engine.new(' ').render
	Haml Comments: -#
	DRIW
	- --> run ruby code
	= insert ruby code
	`code`
	: --> filter
	& --><input>
	|


#SLIM
