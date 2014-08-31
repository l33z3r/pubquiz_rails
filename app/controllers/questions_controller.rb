class QuestionsController < ApplicationController

  before_action :logged_in_required
  before_action :admin_required, only: [:destroy]
  before_action :get_variables

  def index
    @questions = Question.paginate(per_page: 50, page: params[:page]).all_in_order
  end

  def show
  end

  def new
    @question = Question.new(publicly_visible: true)
    @answers = []
    4.times do
      @answers << @question.question_answers.build
    end
  end

  def edit
    @answers = @question.question_answers
  end

  def create
    @question = Question.new(allowed_params)
    @question.created_by = current_user.id if current_user
    if @question.save
      @question.update_attributes(correct_answer_id: @question.question_answers.where(sorting_order: @question.correct_answer_id).first.id)
      flash[:success] = 'Question was successfully created.'
      redirect_to questions_url
    else
      render action: :new
    end
  end

  def update
    params[:question][:updated_by] = current_user.id
    if @question.update_attributes(allowed_params)
      flash[:success] = 'Question was successfully updated.'
      redirect_to questions_url
    else
      render action: :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = 'Question has been deleted.'
    else
      flash[:error] = 'Question could not be deleted.'
    end
    redirect_to questions_url
  end

  protected

  def get_variables
    if params[:id].to_i > 0
      @question = Question.find(params[:id])
    end
    @question_categories = QuestionCategory.all_in_order
    # @countries = Country.all_in_order
  end

  def allowed_params
    params.require(:question).permit(:question_category_id, :visible_text,
                                     :correct_answer_id, :created_by, :updated_by,
                                     :publicly_visible, :approved_by,
        question_answers_attributes: [:id, :visible_text, :sorting_order]
    )
  end

end