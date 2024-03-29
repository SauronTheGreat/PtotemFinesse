class SalesController < ApplicationController
  # GET /sales
  # GET /sales.xml

  def get_sales
    @round=Round.find(params[:round_id])
    @brands=Brand.all
    @brands.each do |brand|
      @sale=Sale.new
      @sale.round_id=@round.id
      @sale.brand_id=brand.id
      volume=0
      @consumer_selections=ConsumerSelection.find_all_by_round_id(@round.id)
      @consumer_selections.each do |consumer_selection|
        if(consumer_selection.brand_id==brand.id and consumer_selection.purchase==true)
          volume+=ConsumerType.find(Consumer.find(consumer_selection.customer_id).consumer_type_id).purchase_quantity
        end
      end
      @sale.volume=volume
      @sale.save
    end
    redirect_to :action => 'index'
  end

  def delete_all_sales
    Sale.delete_all
    redirect_to :action => 'index'
  end

  def index
    @sales = Sale.all
    @sale=Sale.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.xml
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.xml
  def new
    @sale = Sale.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.xml
  def create
    @sale = Sale.new(params[:sale])

    respond_to do |format|
      if @sale.save
        format.html { redirect_to(@sale, :notice => 'Sale was successfully created.') }
        format.xml  { render :xml => @sale, :status => :created, :location => @sale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.xml
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to(@sale, :notice => 'Sale was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.xml
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to(sales_url) }
      format.xml  { head :ok }
    end
  end
end
