class VoteAlternativesController < ApplicationController
  respond_to :html, :json, :js

  # GET /vote_alternatives
  # GET /vote_alternatives.json
  def index
    @vote_alternatives = VoteAlternative.all

    respond_with @vote_alternative
  end

  # GET /vote_alternatives/1
  # GET /vote_alternatives/1.json
  def show
    @vote_alternative = VoteAlternative.find(params[:id])

    respond_with @vote_alternative
  end

  # GET /vote_alternatives/new
  # GET /vote_alternatives/new.json
  def new
    @voting = Voting.find(params[:voting_id])
    @vote_alternative = @voting.vote_alternatives.build

    respond_with @vote_alternative
  end

  # GET /vote_alternatives/1/edit
  def edit
    @vote_alternative = VoteAlternative.find(params[:id])
  end

  # POST /vote_alternatives
  # POST /vote_alternatives.json
  def create
    @voting = Voting.find(params[:voting_id])
    @vote_alternative = @voting.vote_alternatives.build(params[:vote_alternative])

    respond_with(@vote_alternative) do |format|
      if @vote_alternative.save
        format.html { redirect_to @voting, notice: 'Vote alternative was successfully created.' }
        format.json { render json: @vote_alternative, status: :created, location: @vote_alternative }
      else
        format.html { render action: "new" }
        format.json { render json: @vote_alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vote_alternatives/1
  # PUT /vote_alternatives/1.json
  def update
    @vote_alternative = VoteAlternative.find(params[:id])
    @voting = @vote_alternative.voting

    respond_with(@vote_alternative) do |format|
      if @vote_alternative.update_attributes(params[:vote_alternative])
        format.html { redirect_to [@voting.meeting, @voting, @vote_alternative], notice: 'Vote alternative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote_alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_alternatives/1
  # DELETE /vote_alternatives/1.json
  def destroy
    @vote_alternative = VoteAlternative.find(params[:id])
    @vote_alternative.destroy

    respond_with(@vote_alternative) do |format|
      format.js
      format.html { redirect_to @vote_alternative.voting }
      format.json { head :no_content }
    end
  end
end
