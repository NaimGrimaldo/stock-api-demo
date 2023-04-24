# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_resource
    parent_id = request.path_parameters.keys.grep(/_id/).first.to_s
    return if parent_id.blank?

    resource_class = parent_id.remove('_id').classify.constantize
    @current_resource ||= resource_class.find(params[parent_id.to_sym])
  rescue StandardError => _e
    nil
  end

  def health_check
    head :ok
  end
end
