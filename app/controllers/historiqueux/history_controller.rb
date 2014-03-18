require_dependency "historiqueux/application_controller"

module Historiqueux
  class HistoryController < ApplicationController

    def index

      resource = fetch_resource
      @history = resource.versions
      @parent_div = params[:parent_div]

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
