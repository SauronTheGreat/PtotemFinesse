class MediaForRoundsController < ApplicationController
  # GET /media_for_rounds
  # GET /media_for_rounds.xml
  def index
    @media_for_rounds = MediaForRound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @media_for_rounds }
    end
  end

  # GET /media_for_rounds/1
  # GET /media_for_rounds/1.xml
  def show
    @media_for_round = MediaForRound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @media_for_round }
    end
  end

  # GET /media_for_rounds/new
  # GET /media_for_rounds/new.xml
  def new
    @media_for_round = MediaForRound.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @media_for_round }
    end
  end

  # GET /media_for_rounds/1/edit
  def edit
    @media_for_round = MediaForRound.find(params[:id])
  end

  # POST /media_for_rounds
  # POST /media_for_rounds.xml
  def create
    @media_for_round = MediaForRound.new(params[:media_for_round])

    respond_to do |format|
      if @media_for_round.save
        format.html { redirect_to(@media_for_round, :notice => 'Media for round was successfully created.') }
        format.xml  { render :xml => @media_for_round, :status => :created, :location => @media_for_round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @media_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /media_for_rounds/1
  # PUT /media_for_rounds/1.xml
  def update
    @media_for_round = MediaForRound.find(params[:id])

    respond_to do |format|
      if @media_for_round.update_attributes(params[:media_for_round])
        format.html { redirect_to(@media_for_round, :notice => 'Media for round was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @media_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /media_for_rounds/1
  # DELETE /media_for_rounds/1.xml
  def destroy
    @media_for_round = MediaForRound.find(params[:id])
    @media_for_round.destroy

    respond_to do |format|
      format.html { redirect_to(media_for_rounds_url) }
      format.xml  { head :ok }
    end
  end
end
