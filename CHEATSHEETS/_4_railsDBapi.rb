#メソッド名!は例外を発生させる。!がなければオブジェクトか:nilをかえすのが通例。
obj.find_by_name("dave")
ret=obj.find_by_sql("select * fro xxx")
obj.select_all
book = Product.find_or_create_by_name_and_price('book', 2079)
	リスト7●productsテーブルからnameが'book'，priceが2079であるようなProductオブジェクトを読み取り，存在しなかった場合はデータベースにレコードを新規作成する処理

ruby methods
	to_a to_s
	== =~
	class		/	type
	subclasses_of
		remove_subclasses_of
	method
		methods
		singleton_methods
		private_methods
		protected_methods
		public_methods
	is_a?
	kind_of?
	nil?
RailsApp-level API
	scrape2nn
	`
	eql?
	equal?
	===
	[]
	[]=
	as_
	b64encode 	decode64 	encode64 decode_b
	debugger breakpoint
	metaclass
	try
	dup
	tap
	inspect
	daemonize
	clone
	dclone
	returning
	display
	delete
	load_with_new_constant_marking
	unloadable
	with_options
	enable_warnings
	id	/		object_id 	__id__
	send 					__send__
	taguri taguri=
	readonly! readonly?
	taint tainted? untaint
	silence_stderr
		silence_stream silence_warnings
	instance_eval
		instance_exec
		instance_of?
		instance_values
		instance_variable_defined?
		instance_variable_get
		instance_variable_names
		instance_variable_set
		instance_variables
	to_ary
		to_default_s
		to_formatted_s
		to_param
		to_query
		to_sentence
		to_set
	acts_like?
		blank?
		present?
		respond_to?
		duplicable?
	pretty_inspect
		pretty_print
		pretty_print_cycle
		pretty_print_inspect
		pretty_print_instance_variables
	extend
		extend_with_included_modules_from
		extended_by
	require
		require_association
		require_dependency
		require_library_or_gem
		require_or_load
	slice				slice!
	sort				sort!				sort_by
	uniq				uniq!
	split
	#DB-level-API
		#DBobject-level-API
			>
			>=
			abstract_class
				abstract_class=
				abstract_class?
			accepts_nested_attributes_for
			accessible_attributes
			aggregate_mapping
			alias_attribute
				alias_attribute_with_dirty
				alias_attribute_without_dirty
				alias_method_chain
			all
			allocate
			allow_concurrency
			allow_concurrency=
			ancestors
			as_load_path
			attr_accessible
				attr_accessor_with_default
				attr_internal
				attr_internal_accessor
				attr_internal_naming_format
				attr_internal_naming_format=
				attr_internal_reader
				attr_internal_writer
				attr_protected
				attr_readonly
				attribute_method_suffix
				attribute_types_cached_by_default
				attribute_types_cached_by_default=
			authorized_for?
			autoload autoload?
			average
			base_class
			after_create
				after_create_callback_chain
				after_destroy
				after_destroy_callback_chain
				after_find
				after_find_callback_chain
				after_initialize
				after_initialize_callback_chain
				after_save
				after_save_callback_chain
				after_update
				after_update_callback_chain
				after_validation
				after_validation_callback_chain
				after_validation_on_create
				after_validation_on_create_callback_chain
				after_validation_on_update
				after_validation_on_update_callback_chain
			before_create
				before_create_callback_chain
				before_destroy
				before_destroy_callback_chain
				before_save
				before_save_callback_chain
				before_update
				before_update_callback_chain
				before_validation
				before_validation_callback_chain
				before_validation_on_create
				before_validation_on_create_callback_chain
				before_validation_on_update
				before_validation_on_update_callback_chain
			belongs_to
			benchmark
			binding_n
			cache
				cache_attribute?
				cache_attributes
				cached_attributes
			calculate
			cattr_accessor
				cattr_reader
				cattr_writer
			changed changed?
			class
				class_eval
				class_exec
				class_inheritable_accessor
				class_inheritable_array
				class_inheritable_array_writer
				class_inheritable_hash
				class_inheritable_hash_writer
				class_inheritable_reader
				class_inheritable_writer
				class_name
				class_name_of_active_record_descendant
				class_of_active_record_descendant
				class_variable_defined?
				class_variables
			clear_active_connections!
			clear_all_connections!
			clear_reloadable_connections!
			clone
			colorize_logging colorize_logging=
			column_methods_hash
			column_names
			columns
			columns_hash
			composed_of
			compute_type
			configurations configurations=
			connected?
				connection
				connection_handler connection_handler=
				connection_pool
			const_defined?
				const_get
				const_missing
				const_missing_with_dependencies
				const_missing_without_dependencies
				const_set
				constants
			construct_count_options_from_args
			content_columns
			copy_instance_variables_from
			count
			create create!
			create_reflection
			current_scoped_methods
				current_user
				current_user_proc current_user_proc=
			debug_method
			decrement_counter
			default_scope
			default_scoping default_scoping=
			default_timezone default_timezone=
			define_attribute_methods
			define_callbacks
			define_read_methods
			construct_calculation_sql
				count_by_sql
				find_by_sql
			delegate
			delete
				delete_all
			deprecate
				deprecated_method_warning
				deprecation_horizon
			descends_from_active_record?
			destroy destroy_all
			encode_quoted_value
			enum_for
			establish_connection
			execute_grouped_calculation
				execute_simple_calculation
			exists?
			expand_hash_conditions_for_aggregates
				expand_range_bind_variables
			extend
				extend_with_included_modules_from
				extended_by
			find
				find_each
				find_hidden_method
				find_in_batches
			finder_needs_type_condition?
			generated_methods generated_methods?
			get_primary_key
			has_and_belongs_to_many
			has_many
			has_one
			human_attribute_name
			human_name
			include?
			included_in_classes
			included_modules
			increment_counter
			inheritable_attributes
				inheritance_column
				inheritance_column=
				inherited
			instance_eval
				instance_exec
				instance_method
				instance_method_already_implemented?
				instance_methods
				instance_of?
				instance_values
				instance_variable_defined?
				instance_variable_get
				instance_variable_names
				instance_variable_set
				instance_variables
			include_root_in_json
			include_root_in_json=
			json_class_name
			load_with_new_constant_marking
			local_constant_names
				local_constants
			lock_optimistically
				lock_optimistically=
				locking_column
				locking_column=
				locking_enabled?
			logger logger=
			match_attribute_method?
				mattr_accessor
				mattr_reader
				mattr_writer
			merge_conditions
			method_added
			method_defined?
			minimum
			model_name
			module_eval
			module_exec
			name
			named_scope
			new
			observers observers=
				add_observer
				count_observers
				delete_observer
				delete_observers
				instantiate_observers
				notify_observers
			original_primary_key
			original_table_name
			parent parent_name parents
			partial_updates partial_updates= partial_updates?
			post_mortem_method
			preload_associations
			pretty_inspect
				pretty_print
				pretty_print_cycle
				pretty_print_inspect
				pretty_print_instance_variables
			primary_key primary_key=
			primary_key_prefix_type primary_key_prefix_type=
			private_class_method public_class_method
			private_instance_methods protected_instance_methods public_instance_methods
			private_method_defined? protected_method_defined? public_method_defined?
			private_methods protected_methods public_methods
			protected_attributes
			quote_bound_value
				quote_value
				quoted_locking_column
				quoted_table_name
			raise_if_bind_arity_mismatch
			read_inheritable_attribute
			readonly_attributes
			record_timestamps record_timestamps=
			reflect_on_aggregation
				reflect_on_all_aggregations
				reflect_on_all_associations
				reflect_on_all_autosave_associations
				reflect_on_association
				reflections
			reject_new_nested_attributes_procs reject_new_nested_attributes_procs=
			remove_class
				remove_connection
				remove_subclasses
				remove_subclasses_of
			replace_bind_variables
			replace_named_bind_variables
			require
				require_association
				require_dependency
				require_library_or_gem
				require_or_load
			reset_column_information
				reset_column_information_and_inheritable_attributes_for_all_subclasses
				reset_inheritable_attributes
				reset_locking_column
				reset_primary_key
				reset_sequence_name
				reset_subclasses
				reset_table_name
			retrieve_connection
			sanitize
				sanitize_conditions
				sanitize_sql
				sanitize_sql_array
				sanitize_sql_for_assignment
				sanitize_sql_for_conditions
				sanitize_sql_hash
				sanitize_sql_hash_for_assignment
				sanitize_sql_hash_for_conditions
			schema_format schema_format=
			scope scopes
			scoped scoped?
			scoped_methods
			self_and_descendants_from_active_record
			send
			sequence_name sequence_name=
			serialize
			serialized_attributes
			set_inheritance_column
			set_locking_column
			set_primary_key
			set_readonly_option!
			set_sequence_name
			set_table_name
			silence
			silence_stderr
			silence_stream
			silence_warnings
			singleton_methods
			skip_time_zone_conversion_for_attributes
			skip_time_zone_conversion_for_attributes=
			sqlite3_connection
			sqlite_connection
			sti_name
			store_full_sti_class store_full_sti_class= store_full_sti_class?
			subclasses
			subclasses_of
			sum
			superclass
				superclass_delegating_accessor
				superclass_delegating_reader
				superclass_delegating_writer
			suppress
			synchronize
			table_exists?
			table_name table_name=
			table_name_prefix table_name_prefix=
			table_name_suffix table_name_suffix=
			time_zone_aware_attributes
				time_zone_aware_attributes=
				timestamped_migrations
				timestamped_migrations=
			to_enum
			to_param
			to_query
			transaction
			uncached
			unloadable
			update
				update_all
				update_counters
				update_counters_with_lock
				update_counters_without_lock
			valid_keys_for_belongs_to_association
				valid_keys_for_belongs_to_association=
				valid_keys_for_has_and_belongs_to_many_association
				valid_keys_for_has_and_belongs_to_many_association=
				valid_keys_for_has_many_association
				valid_keys_for_has_many_association=
				valid_keys_for_has_one_association
				valid_keys_for_has_one_association=
			validate
				validate_callback_chain
				validate_find_options
				validate_on_create
				validate_on_create_callback_chain
				validate_on_update
				validate_on_update_callback_chain
				validates_acceptance_of
				validates_associated
				validates_confirmation_of
				validates_each
				validates_exclusion_of
				validates_format_of
				validates_inclusion_of
				validates_length_of
				validates_numericality_of
				validates_presence_of
				validates_size_of
				validates_uniqueness_of
			verification_timeout verification_timeout=
			verify_active_connections!
			with_exclusive_scope
			with_options
			with_scope
			write_inheritable_array write_inheritable_attribute write_inheritable_hash
			yaml_as yaml_tag_class_name yaml_tag_read_class yaml_tag_subclasses?

			#recordsset-level-API
				#records-level-API
				&
				*
				+
				-
				<<
				<=>
				after
				assoc
				rassoc
				at
				class
				class_eval
				collect				collect!
				combination
				compact				compact!
				copy_instance_variables_from
				cycle
				delete_at
				delete_if
				drop
				drop_while
				entries
				enum_cons
					enum_for
					enum_slice
					enum_with_index
				extract_options!
				fill
				fetch
					first
					second
					third
					fourth
					fifth
					last
					forty_two
				#record選択
					choice
					detect
					find
					find_all
					find_index
					grep
					select
					each
						each_cons
						each_index
						each_slice
						each_with_index
						each_with_object
					from				to
					group_by 	in_groups 	in_groups_of
					insert
					reverse				reverse!
						reverse_each
						rindex
				#record範囲指定
					index				index_by				indexes
					include?
					member?
					many?
					none?
					one?
					all?
					any?
					empty?
					min				min_by
					max				max_by
					minmax				minmax_by

				flatten				flatten!
				freeze				frozen?
				hash
				indices
				inject

				nitems
				pack
				partition
				permutation
				product
				reduce

				clear
				concat
				count
				join
				replace
				rand
				values_at
				map				map!
				reject				reject!
				shift				unshift
				push				pop
				shuffle				shuffle!
				|
				nil

				sum
				suppress
				take
				take_while

				transpose
				zip
					record(row,column-level-API
					@r2chnns[1].methods.sort.grep(/./)

					errors
					hash
					logger
					destroy

					quoted_id
					id=
					id_before_type_cast
					_delete
					becomes
					cache_key
					clear_aggregation_cache
					class_eval
					colorize_logging
					configurations
					copy_instance_variables_from
					default_scoping					default_timezone
					connection					connection_handler
					decrement					decrement!
					increment					increment!

					enum_for
					include_root_in_json
					schema_format
					suppress
					method_missing
					to_label
					to_query
					transaction
					timestamped_migrations
					pluralize_table_names
					primary_key_prefix_type
					existing_record_check?
					new_record?
					record_timestamps
					rollback_active_record_state!
					with_transaction_returning_status
					
					table_name_prefix					table_name_suffix
					store_full_sti_class					store_full_sti_class?
					toggle					toggle!
					changed					changed?					changes
					created_at					created_at=					created_at?
					updated_at					updated_at=					updated_at?
					unsaved=					unsaved?
					mark_for_destruction					marked_for_destruction?
					partial_updates					partial_updates?
					freeze					frozen?
					valid?					invalid?
					validate					validate_on_create					validate_on_update
					run_callbacks
						valid_with_callbacks?					valid_without_callbacks?
					reload
						reload_with_autosave_associations					reload_without_autosave_associations
						reload_with_dirty					reload_without_dirty
					lock!
						lock_optimistically
						locking_enabled?
					destroy_with_callbacks					destroy_without_callbacks
						destroy_with_transactions					destroy_without_transactions
						destroy_without_lock
					associated_valid?
						associations_for_update
						clear_association_cache
						no_errors_in_associated?
					after_create					before_create
						after_destroy					before_destroy
						after_update					before_update
						after_validation_on_create					before_validation_on_create
						after_validation_on_update					before_validation_on_update
						after_save					before_save
						after_validation					before_validation
					save					save!
						save_associated					save_associated!
						save_with_dirty					save_with_dirty!
						save_with_transactions					save_with_transactions!
						save_with_validation					save_with_validation!
						save_without_dirty					save_without_dirty!
						save_without_transactions					save_without_transactions!
						save_without_validation					save_without_validation!
						save_with_unsaved_flag					save_without_unsaved_flag
					attributes					attributes=					attribute_present?					has_attribute?
						unserializable_attribute?					unserialize_attribute
						update_attribute					update_attributes					update_attributes!
							attributes_before_type_cast
							attribute_for_inspect
							attribute_names
							attribute_types_cached_by_default
							column_for_attribute
							query_attribute
							reject_new_nested_attributes_procs
							skip_time_zone_conversion_for_attributes
							time_zone_aware_attributes
							respond_to_without_attributes?
						read_attribute					write_attribute
							read_attribute_before_type_cast
							write_attribute_without_dirty
