module Resourceable
  extend ActiveSupport::Concern

  included do
    before_action :find_resource, only: [:edit, :update, :destroy, :show]
  end

  def index
    @resources = klass.all
    respond_with(@resources)
  end

  def show
    respond_with(@resource)
  end

  def edit
    respond_with(@resource)
  end

  def update
    if @resource.update(resource_params)
      respond_with(@resource, status: :ok)
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def new
    @resource = klass.new
    respond_with(@resource)
  end

  def create
    @resource = klass.new(resource_params)
    if @resource.save
      respond_with(@resource, status: :created)
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to [controller_name.to_sym], notice: "Deleted"
  end

  private

  def find_resource
    @resource = klass.find(params[:id])
  end

  def klass
    controller_name.singularize.camelize.constantize
  end

  def resource_params
    params.require(resource_name).permit(*klass.new.attributes.keys)
  end
end
