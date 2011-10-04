class ProductionsController < ApplicationController
  # GET /productions
  # GET /productions.xml
  def index
    @productions = Production.all
    @production=Production.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @productions }
    end
  end

  # GET /productions/1
  # GET /productions/1.xml
  def show
    @production = Production.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @production }
    end
  end

  # GET /productions/new
  # GET /productions/new.xml
  def new
    @production = Production.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @production }
    end
  end

  # GET /productions/1/edit
  def edit
    @production = Production.find(params[:id])
  end

  # POST /productions
  # POST /productions.xml
  def create
    @production = Production.new(params[:production])

    respond_to do |format|
      if @production.save
         @production=Production.last
         production_cost=0
         @product_compositions=ProductComposition.find(:all,:conditions => ['product_type_id=?',Factory.find(@production.factory_id).product_type_id])
         @product_compositions.each do |product_composition|
           production_cost+=((product_composition.ratio)*(product_composition.weight)*(@production.quantity)*(FactoryInputPrice.find_by_factory_input_id(product_composition.factory_input_id).price))/100
         end
         @production.production_cost=production_cost
         @production.save
        format.html { redirect_to(:controller => :productions,:action => "index", :notice => 'Production was successfully created.') }
        format.xml  { render :xml => @production, :status => :created, :location => @production }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @production.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /productions/1
  # PUT /productions/1.xml
  def update
    @production = Production.find(params[:id])

    respond_to do |format|
      if @production.update_attributes(params[:production])
        format.html { redirect_to(@production, :notice => 'Production was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @production.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.xml
  def destroy
    @production = Production.find(params[:id])
    @production.destroy

    respond_to do |format|
      format.html { redirect_to(productions_url) }
      format.xml  { head :ok }
    end
  end
end
