transaction省略可能か？
	~/Downloads/src/kp-beryl/vendor/bundle/ruby/2.3.0/gems/activerecord-4.2.6/lib/active_record/connection_adapters/abstract/transaction.rb +182
	      def within_new_transaction(options = {})$
        transaction = begin_transaction options$
        yield$
      rescue Exception => error$
        rollback_transaction if transaction$
        raise$
      ensure$
        unless error$
          if Thread.current.status == 'aborting'$
            rollback_transaction if transaction$
          else$
            begin$
p "###########ここがはしる#####"$
              commit_transaction$
