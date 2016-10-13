class Api::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?

  def index
    render json: params.to_json
  end

  protected

  def json_request?
    request.format.json?
  end

  private

  def params
    @params ||= JSON.parse(request.body.read, symbolize_names: true)
  end
end
