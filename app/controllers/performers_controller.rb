class PerformersController < ApplicationController
  # GET /performers
  # GET /performers.json
  def index
    @performers = Performer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @performers }
    end
  end

  # GET /performers/1
  # GET /performers/1.json
  def show
    @performer = Performer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @performer }
    end
  end

  # GET /performers/new
  # GET /performers/new.json
  def new
    @performer = Performer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @performer }
    end
  end

  # GET /performers/1/edit
  def edit
    @performer = Performer.find(params[:id])
  end

  # POST /performers
  # POST /performers.json
  def create
    @performer = Performer.new(params[:performer])

    respond_to do |format|
      if @performer.save
        format.html { redirect_to @performer, notice: 'Performer was successfully created.' }
        format.json { render json: @performer, status: :created, location: @performer }
      else
        format.html { render action: "new" }
        format.json { render json: @performer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /performers/1
  # PUT /performers/1.json
  def update
    @performer = Performer.find(params[:id])

    respond_to do |format|
      if @performer.update_attributes(params[:performer])
        format.html { redirect_to @performer, notice: 'Performer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @performer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performers/1
  # DELETE /performers/1.json
  def destroy
    @performer = Performer.find(params[:id])
    @performer.destroy

    respond_to do |format|
      format.html { redirect_to performers_url }
      format.json { head :no_content }
    end
  end
end
