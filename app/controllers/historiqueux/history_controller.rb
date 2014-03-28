require_dependency "historiqueux/application_controller"

module Historiqueux
  class HistoryController < ApplicationController

    def index

      resource = fetch_resource
      if resource.respond_to?('versions')
        @history = resource.versions
        @parent_div = params[:parent_div]
        @relations = @resourceKlass.reflect_on_all_associations.map { |r| r.name }.reject { |i| i == :versions }
      end

      if request.xhr?
        render :layout => false
      end

    end

    def index_relations

      resource = fetch_resource
      if resource.respond_to?('versions')
        @history = resource.versions
        @parent_div = params[:parent_div]

        fetch_relation_resource(params[:relation_resource], resource)

        if @relation_resourceKlass

          relations = @relation_resourceKlass.reflect_on_all_associations
          cleaned_relations_array = remove_polymorphic_relations(relations)
          @relations = cleaned_relations_array.map { |r| {:name => r.name,
                                                          :parent => r.active_record.to_s,
                                                          :klass => r.klass } }.reject { |i| i[:name] == :versions }

          @history_relations = {}
          @relation_resource_list.each do |rr|
            @history_relations.store(rr.id, rr.versions)
          end

        end

      end

      if request.xhr?
        render :layout => false
      end

    end

    def remove_polymorphic_relations(relations)
      cleaned_array = []
      relations.each do |relation|
        unless relation.options.empty?
          unless relation.options[:polymorphic]
            cleaned_array << relation
          end
        else
          cleaned_array << relation
        end
      end
      cleaned_array
    end


    def show

      @parent_div = params[:parent_div]
      @model_instance = fetch_resource
      version_id = params[:version_id]
      @preceding_version = @model_instance.versions.where(:id => version_id).first
      @version = @preceding_version.next

      if request.xhr?
        render :layout => false
      end

    end

    def fetch_resource
      @resource = params[:resource]
      @class_name = classify_namespace(params[:resource])
      @resourceKlass = eval(@class_name)
      @resource_id = params[:resource_id]
      @resourceKlass.find(@resource_id)
    end

    def fetch_relation_resource(relation_resource, resource)
      @relation_resource = relation_resource
      @relation_resource_list = ensure_enumerable(resource.send(@relation_resource))
      if @relation_resource_list.first.respond_to?('versions')
        namespaced_class_name = @relation_resource_list.first.versions.first.item_type
        @relation_class_name = classify_namespace(namespaced_class_name)
        @relation_resourceKlass = eval(@relation_class_name)
      end
    end

    def ensure_enumerable(object)
      enum_object = object
      unless object.respond_to?(:each)
        enum_object = [object]
      end
      enum_object
    end

    def classify_namespace(const)
      const = const.classify
      if const.include?('::')
        new_const = ''
        splitted = const.split('::')
        for str in splitted do
          new_const = new_const + str.classify + '::'
        end
        const = new_const[0..(new_const.length - 3)]
      end
      const
    end

  end
end
