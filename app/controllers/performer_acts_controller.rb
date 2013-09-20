class PerformerActsController < ApplicationController
  # GET /performer_acts
  # GET /performer_acts.json
  def index
    @performer_acts = PerformerAct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @performer_acts }
    end
  end

  # GET /performer_acts/1
  # GET /performer_acts/1.json
  def show
    @performer_act = PerformerAct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @performer_act }
    end
  end

  # GET /performer_acts/new
  # GET /performer_acts/new.json
  def new
    @performer_act = PerformerAct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @performer_act }
    end
  end

  # GET /performer_acts/1/edit
  def edit
    @performer_act = PerformerAct.find(params[:id])
  end

  # POST /performer_acts
  # POST /performer_acts.json
  def create
    @performer_act = PerformerAct.new(params[:performer_act])

    respond_to do |format|
      if @performer_act.save
        format.html { redirect_to @performer_act, notice: 'Performer act was successfully created.' }
        format.json { render json: @performer_act, status: :created, location: @performer_act }
      else
        format.html { render action: "new" }
        format.json { render json: @performer_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /performer_acts/1
  # PUT /performer_acts/1.json
  def update
    @performer_act = PerformerAct.find(params[:id])

    respond_to do |format|
      if @performer_act.update_attributes(params[:performer_act])
        format.html { redirect_to @performer_act, notice: 'Performer act was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @performer_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performer_acts/1
  # DELETE /performer_acts/1.json
  def destroy
    @performer_act = PerformerAct.find(params[:id])
    @performer_act.destroy

    respond_to do |format|
      format.html { redirect_to performer_acts_url }
      format.json { head :no_content }
    end
  end
end
