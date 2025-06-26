class FollowRequestsController < ApplicationController
  before_action :set_follow_request, only: %i[show edit update destroy accept reject]

  # GET /follow_requests
  def index
    @follow_requests = FollowRequest.all
  end

  # GET /follow_requests/1
  def show
  end

  # GET /follow_requests/new
  def new
    @follow_request = FollowRequest.new
  end

  # GET /follow_requests/1/edit
  def edit
  end

  # POST /follow_requests
  def create
    @follow_request = FollowRequest.new(follow_request_params)

    respond_to do |format|
      if @follow_request.save
        format.html { redirect_to follow_requests_path, notice: "Follow request was successfully created." }
        format.json { render :show, status: :created, location: @follow_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @follow_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follow_requests/1
  def update
    respond_to do |format|
      if @follow_request.update(follow_request_params)
        format.html { redirect_to @follow_request, notice: "Follow request was successfully updated." }
        format.json { render :show, status: :ok, location: @follow_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follow_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /follow_requests/1/accept
  def accept
    @follow_request.update(status: "accepted")
    redirect_back fallback_location: root_path, notice: "Follow request accepted."
  end

  # PATCH /follow_requests/1/reject
  def reject
    @follow_request.update(status: "rejected")
    redirect_back fallback_location: root_path, alert: "Follow request rejected."
  end

  # DELETE /follow_requests/1
  def destroy
    @follow_request.destroy!

    respond_to do |format|
      format.html { redirect_to follow_requests_path, status: :see_other, notice: "Follow request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_follow_request
    @follow_request = FollowRequest.find(params[:id])
  end

  def follow_request_params
    params.require(:follow_request).permit(:recipient_id, :sender_id, :status)
  end
end
