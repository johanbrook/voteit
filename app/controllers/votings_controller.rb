class VotingsController < ApplicationController
  # GET /votings
  # GET /votings.json
  def index
    @votings = Voting.all

    respond_to do |format|
      format.html { redirect_to meeting_path(params[:meeting_id]) }
      format.json { render json: @votings }
    end
  end

  # GET /votings/1
  # GET /votings/1.json
  def show
    @voting = Voting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voting }
    end
  end

  # GET /votings/new
  # GET /votings/new.json
  def new
    @meeting = Meeting.find(params[:meeting_id])
    @voting = @meeting.votings.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voting }
    end
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

    respond_to do |format|
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

    respond_to do |format|
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

    respond_to do |format|
      format.html { redirect_to meeting_votings_url }
      format.json { head :no_content }
    end
  end
end
