class Tqrdc::SuppliersController < ApplicationController
  before_action :set_tqrdc_supplier, only: [:show, :edit, :update, :destroy]

  autocomplete :supplier, :vname, {class_name: 'Tqrdc::Supplier'}
  # GET /tqrdc/suppliers
  # GET /tqrdc/suppliers.json
  def index
    name = params[:vname] || ''
    @tqrdc_suppliers = Tqrdc::Supplier
                           .where("vname like '%#{name}%' ")
                           .order(:vname).page params[:page]
  end

  # GET /tqrdc/suppliers/1
  # GET /tqrdc/suppliers/1.json
  def show
  end

  # GET /tqrdc/suppliers/new
  def new
    @tqrdc_supplier = Tqrdc::Supplier.new
  end

  # GET /tqrdc/suppliers/1/edit
  def edit
  end

  # POST /tqrdc/suppliers
  # POST /tqrdc/suppliers.json
  def create
    @tqrdc_supplier = Tqrdc::Supplier.new(tqrdc_supplier_params)

    respond_to do |format|
      if @tqrdc_supplier.save
        format.html { redirect_to @tqrdc_supplier, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @tqrdc_supplier }
      else
        format.html { render :new }
        format.json { render json: @tqrdc_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tqrdc/suppliers/1
  # PATCH/PUT /tqrdc/suppliers/1.json
  def update
    respond_to do |format|
      if @tqrdc_supplier.update(tqrdc_supplier_params)
        format.html { redirect_to @tqrdc_supplier, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: @tqrdc_supplier }
      else
        format.html { render :edit }
        format.json { render json: @tqrdc_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tqrdc/suppliers/1
  # DELETE /tqrdc/suppliers/1.json
  def destroy
    @tqrdc_supplier.destroy
    respond_to do |format|
      format.html { redirect_to tqrdc_suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tqrdc_supplier
      @tqrdc_supplier = Tqrdc::Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tqrdc_supplier_params
      params.require(:tqrdc_supplier).permit(:id, :supplier, :vname, :email , :commodity_mgr_id, :start_period, :end_period , :mtype , :territory)
    end
end
