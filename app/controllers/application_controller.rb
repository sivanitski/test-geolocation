class ApplicationController < ActionController::API
  def serialized(controller, data, options= {})
    "#{controller.classify}Serializer".constantize.new(data, options).serializable_hash.to_json
  end
end
