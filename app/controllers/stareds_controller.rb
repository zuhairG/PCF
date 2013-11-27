class StaredsController < ApplicationController
  # GET /stareds
  # GET /stareds.json
  def index
    @stareds = Stared.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stareds }
    end
  end

  # GET /stareds/1
  # GET /stareds/1.json
  def show
    @stared = Stared.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stared }
    end
  end

  # GET /stareds/new
  # GET /stareds/new.json
  def new
    @stared = Stared.new
  end

  # GET /stareds/1/edit
  def edit
    @stared = Stared.find(params[:id])
  end

  # POST /stareds
  # POST /stareds.json
  def create
    
    @stared = Stared.new(params[:stared])

    respond_to do |format|
      if @stared.save
        format.html { redirect_to events_path, notice: 'Starred successfully' }
        format.mobile {redirect_to events_path, notice: 'Starred successfully'}
        format.json { render json: @stared, status: :created, location: @stared }
      else
        format.html { render action: "new" }
        format.json { render json: @stared.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stareds/1
  # PUT /stareds/1.json
  def update
    @stared = Stared.find(params[:id])

    respond_to do |format|
      if @stared.update_attributes(params[:stared])
        format.html { redirect_to @stared, notice: 'Stared was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stared.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stareds/1
  # DELETE /stareds/1.json
  def destroy
    @stared = Stared.find(params[:id])
    @stared.destroy

    respond_to do |format|
      format.html { redirect_to events_path }
      format.mobile {redirect_to events_path}
      
      format.json { head :no_content }
    end
  end
  
end
