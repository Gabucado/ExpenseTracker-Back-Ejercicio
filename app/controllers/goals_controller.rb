class GoalsController < ApplicationController
  before_action :set_goal, only: %i[ show update destroy ]
  before_action :authorize_request

  # GET /goals
  def index
    @goals = Goal.all

    render json: @goals
  end

  # GET /goals/1
  def show
    render json: @goal
  end

  # POST /goals
  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      render json: @goal, status: :created, location: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /goals/1
  def update
    if @goal.update(goal_params)
      render json: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.expect(goal: [ :user_id, :name, :target_amount, :current_ammount, :due_date ])
    end
end
