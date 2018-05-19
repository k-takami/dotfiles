model  http://stackoverflow.com/questions/516579/is-there-a-way-to-get-a-collection-of-all-the-models-in-your-rails-app
ActiveRecord::Base.descendants
ApplicationRecord.descendants
ActiveRecord::Base.send :subclasses
ActiveRecord::Base.send(:subclasses).map(&:name)
Module.constants.select { |c| (eval c).is_a? Class }



