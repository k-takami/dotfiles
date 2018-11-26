

note
    def create_instance(proxy_class, nillable=false)
      principal = RailsAdapter::Session::Base.current_user.context_principal
      if !nillable && principal.nil?
        raise WrongImplementationException.new("proxy requires operator_principal.")
      end

      key = proxy_class.to_s
      if @logger && principal
        @logger.debug("* proxy:#{key}(#{principal.userId})")
      end

      if CACHE_ENABLED
        hash = Thread.current[:proxy_store]
        if hash
          # Evaluate the proxy instance associated with this current thread.
          proxy = hash[key]
          if principal && proxy && proxy.auth_info && proxy.auth_info.sessionKey == principal.sessionKey
            return proxy
          else
            # Discard the proxy instance as auth info doesn't match.
            hash.delete(key)
          end
        else
          # Assign a new Hash to the current thread.
          hash = {}
          Thread.current[:proxy_store] = hash
        end
      end
      # Prepare a new one.
      proxy = proxy_class.new(principal)
      hash[key] = proxy if CACHE_ENABLED
      proxy
    end

     def dms_proxy(model_sym, nillable=false)
      dms = MODEL_TO_PROXY_IRREGULAR[model_sym].presence || model_sym.to_s.classify
      create_instance("InventitDms::Json#{dms}Proxy".constantize, nillable)
    end
Rails Template探知ロジック
    def initialize
      @cache = Cache.new
    end

    def clear_cache
      @cache.clear
    end

    # Normalizes the arguments and passes it on to find_templates.
    def find_all(name, prefix=nil, partial=false, details={}, key=nil, locals=[])
      cached(key, [name, prefix, partial], details, locals) do
        aaa= find_templates(name, prefix, partial, details)
# puts "━━@view_paths.exists?━━━━━━━━━━2c"
# puts aaa unless aaa.empty?
aaa
      end
    end

    def find_all_anywhere(name, prefix, partial=false, details={}, key=nil, locals=[])
      cached(key, [name, prefix, partial], details, locals) do
        find_templates(name, prefix, partial, details, true)
      end
    end

/usr/local/lib/ruby/gems/2.3.0/gems/actionview-5.0.0.1/lib/action_view/template/resolver.rb                                
        @view_paths.find(*args_for_lookup(name, prefixes, partial, keys, options))
      end
      alias :find_template :find

      def find_file(name, prefixes = [], partial = false, keys = [], options = {})
        @view_paths.find_file(*args_for_lookup(name, prefixes, partial, keys, options))
      end

      def find_all(name, prefixes = [], partial = false, keys = [], options = {})
        @view_paths.find_all(*args_for_lookup(name, prefixes, partial, keys, options))
      end

      def exists?(name, prefixes = [], partial = false, keys = [], **options)
        @view_paths.exists?(*args_for_lookup(name, prefixes, partial, keys, options))
      end
      alias :template_exists? :exists?

      def any?(name, prefixes = [], partial = false)
puts "━━"
        @view_paths.exists?(*args_for_any(name, prefixes, partial))
      end
      alias :any_templates? :any?

      # Adds fallbacks to the view paths. Useful in cases when you are rendering


/usr/local/lib/ruby/gems/2.3.0/gems/actionview-5.0.0.1/lib/action_view/lookup_context.rb                                   
  # Third, if we DON'T find a template AND the request is a page load in a web
  # browser (technically, a non-XHR GET request for an HTML response) where
  # you reasonably expect to have rendered a template, then we raise
  # <tt>ActionView::UnknownFormat</tt> with an explanation.
  #
  # Finally, if we DON'T find a template AND the request isn't a browser page
  # load, then we implicitly respond with 204 No Content.
  module ImplicitRender

    # :stopdoc:
    include BasicImplicitRender

    def default_render(*args)
      if template_exists?(action_name.to_s, _prefixes, variants: request.variant)
puts "━━━━━━━━━━━━2"
        render(*args)
      elsif any_templates?(action_name.to_s, _prefixes)
puts "━━━━━━━━━━━━3"
        message = "#{self.class.name}\##{action_name} is missing a template " \
          "for this request format and variant.\n" \
          "\nrequest.formats: #{request.formats.map(&:to_s).inspect}" \
          "\nrequest.variant: #{request.variant.inspect}"

        raise ActionController::UnknownFormat, message
      elsif interactive_browser_request?



/usr/local/lib/ruby/gems/2.3.0/gems/actionpack-5.0.0.1/lib/action_controller/metal/implicit_render.rb                      

    def find_all_with_query(query) # :nodoc:
      paths.each do |resolver|
        templates = resolver.find_all_with_query(query)
        return templates unless templates.empty?
      end

      []
    end

    private

    def _find_all(path, prefixes, args, outside_app)
      prefixes = [prefixes] if String === prefixes
      prefixes.each do |prefix|
        paths.each do |resolver|
          if outside_app
            templates = resolver.find_all_anywhere(path, prefix, *args)
          else
            templates = resolver.find_all(path, prefix, *args)
          end
#puts "###########{templates}" unless templates.empty?
          return templates unless templates.empty?
        end


/usr/local/lib/ruby/gems/2.3.0/gems/actionview-5.0.0.1/lib/action_view/path_set.rb                                         
"/usr/local/lib/ruby/gems/2.3.0/gems/actionview-5.0.0.1/lib/action_view/lookup_context.rb" 281L, 8510C written
scaffolding







