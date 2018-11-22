**万能ルーティング** <--危険要注意
 match '/:controller(/:action(/:id))'


上述万能ルーティングの以下に基本形；
  resources :sso
  get 'sso/Login*' , :to => 'sso#index'
  get 'sso/Logout*', :to => 'sso#show'
  #match 'sso/Logout*', :to => 'sso#show' , :via => :get


namespase :name  do ----> relative definition  under :name controller path
scope :name do --->  just genate upparent upper :name directory. 
trailing_slash => true: ルート末尾に/付加

