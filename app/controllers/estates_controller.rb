class EstatesController < ApplicationController
  # GET /estates
  # GET /estates.json
  def index
    @estates = Estate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estates }
    end
  end

  # GET /estates/1
  # GET /estates/1.json
  def show
    @estate = Estate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estate }
    end
  end

  # GET /estates/new
  # GET /estates/new.json
  def new
    @estate = Estate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estate }
    end
  end

  # GET /estates/1/edit
  def edit
    @estate = Estate.find(params[:id])
  end

  # POST /estates
  # POST /estates.json
  def create
    @estate = Estate.new(params[:estate])

    respond_to do |format|
      if @estate.save
        format.html { redirect_to @estate, notice: 'Estate was successfully created.' }
        format.json { render json: @estate, status: :created, location: @estate }
      else
        format.html { render action: "new" }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /estates/1
  # PUT /estates/1.json
  def update
    @estate = Estate.find(params[:id])

    respond_to do |format|
      if @estate.update_attributes(params[:estate])
        format.html { redirect_to @estate, notice: 'Estate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estates/1
  # DELETE /estates/1.json
  def destroy
    @estate = Estate.find(params[:id])
    @estate.destroy

    respond_to do |format|
      format.html { redirect_to estates_url }
      format.json { head :no_content }
    end
  end
end
