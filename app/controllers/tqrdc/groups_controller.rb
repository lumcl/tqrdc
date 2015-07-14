class Tqrdc::GroupsController < ApplicationController
  before_action :set_tqrdc_group, only: [:show, :edit, :update, :destroy]
  autocomplete :tqrdc_group, :name

  # GET /tqrdc/groups
  # GET /tqrdc/groups.json
  def index
    @tqrdc_groups = Tqrdc::Group.all.page
  end

  # GET /tqrdc/groups/1
  # GET /tqrdc/groups/1.json
  def show
  end

  # GET /tqrdc/groups/new
  def new
    @tqrdc_group = Tqrdc::Group.new
    @tqrdc_group.owner_id = current_user.id
    @tqrdc_group.creator_id = current_user.id
    @tqrdc_group.updater_id = current_user.id
  end

  # GET /tqrdc/groups/1/edit
  def edit
    @tqrdc_group.updater_id = current_user.id
  end

  # POST /tqrdc/groups
  # POST /tqrdc/groups.json
  def create
    @tqrdc_group = Tqrdc::Group.new(tqrdc_group_params)

    respond_to do |format|
      if @tqrdc_group.save
        format.html { redirect_to @tqrdc_group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_group }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/groups/1
  # PATCH/PUT /tqrdc/groups/1.json
  def update
    respond_to do |format|
      if @tqrdc_group.update(tqrdc_group_params)
        format.html { redirect_to @tqrdc_group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_group }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/groups/1
  # DELETE /tqrdc/groups/1.json
  def destroy
    @tqrdc_group.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_group
      @tqrdc_group = Tqrdc::Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_group_params
      params.require(:tqrdc_group).permit(:id, :name, :description, :score, :owner_id, :creator_id, :updater_id)
    end
end
