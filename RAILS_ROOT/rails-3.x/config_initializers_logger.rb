#suppressing routing error to assets(*.js,*.css,*img) files
#NOTE: applicable under rails_version < 4
if Rails::VERSION::STRING < "4"
  # if Rails.env.development?
      class ActionDispatch::DebugExceptions
        alias_method :old_log_error, :log_error
        def log_error(env, wrapper)
          if wrapper.exception.is_a?  ActionController::RoutingError
            return
          else
            old_log_error env, wrapper
          end
        end
      end
  # end
end
