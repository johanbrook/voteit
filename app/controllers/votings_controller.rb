class VotingsController < ApplicationController
  respond_to :html, :json

  # GET /votings
  # GET /votings.json
  def index
    @votings = Voting.all

    respond_with @votings
  end

  def vote
    @voting = Voting.find(params[:voting_id])
    @vote_alternative = @voting.vote_alternatives.find(params[:alt])
    @vote_alternative.update_attribute :votes, @vote_alternative.votes + 1

    respond_with(@voting) do |format|
      format.html { redirect_to [@voting.meeting, @voting] }
      format.json { head :no_content }
    end
  end

  def open
    @voting = Voting.find(params[:voting_id])
    @voting.update_attribute :open, true

    respond_with(@voting) do |format|
      format.html { redirect_to [@voting.meeting, @voting], :notice => "Voting opened" }
      format.json { head :no_content }
    end
  end

  def close
    @voting = Voting.find(params[:voting_id])
    @voting.update_attribute :open, false

    respond_with(@voting) do |format|
      format.html { redirect_to [@voting.meeting, @voting], :notice => "Voting closed" }
      format.json { head :no_content }
    end
  end

  # GET /votings/1
  # GET /votings/1.json
  def show
    @voting = Voting.find(params[:id])
    @alternatives = @voting.vote_alternatives.order("votes DESC")

    respond_with @voting
  end

  # GET /votings/new
  # GET /votings/new.json
  def new
    @meeting = Meeting.find(params[:meeting_id])
    @voting = @meeting.votings.build

    respond_with @voting
  end

  # GET /votings/1/edit
  def edit
    @voting = Voting.find(params[:id])
  end

  # POST /votings
  # POST /votings.json
  def create
    @meeting = Meeting.find(params[:meeting_id])
    @voting = @meeting.votings.build(params[:voting])

    respond_with(@voting) do |format|
      if @voting.save
        format.html { redirect_to [@meeting, @voting], notice: 'Voting was successfully created.' }
        format.json { render json: @voting, status: :created, location: @voting }
      else
        format.html { render "new" }
        format.json { render json: @voting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /votings/1
  # PUT /votings/1.json
  def update
    @voting = Voting.find(params[:id])
    @meeting = @voting.meeting

    respond_with(@voting) do |format|
      if @voting.update_attributes(params[:voting])
        format.html { redirect_to [@meeting, @voting], notice: 'Voting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @voting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votings/1
  # DELETE /votings/1.json
  def destroy
    @voting = Voting.find(params[:id])
    @voting.destroy

    respond_with(@voting) do |format|
      format.html { redirect_to meeting_votings_url }
      format.json { head :no_content }
    end
  end
end
