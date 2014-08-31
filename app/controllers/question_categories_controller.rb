class QuestionCategoriesController < ApplicationController

  AVAILABLE_METHODS = %w(index)

  before_action :logged_in_required
  before_action :admin_required
  before_action :get_variables

  def index
    @question_categories = QuestionCategory.paginate(page: params[:page], per_page: 50).all_in_order
  end

  def show
  end

  def new
    @question_category = QuestionCategory.new
  end

  def edit
  end

  def create
    @question_category = QuestionCategory.new(allowed_params)
    @question_category.created_by = current_user.id if current_user
    if @question_category.save
      flash[:success] = 'QuestionCategory was successfully created'
      redirect_to question_categories_url
    else
      render action: :new
    end
  end

  def update
    params[:updated_by] = current_user.id
    if @question_category.update_attributes(allowed_params)
      flash[:success] = 'QuestionCategory was successfully updated'
      redirect_to question_categories_url
    else
      render action: :edit
    end
  end

  def destroy
    if @question_category.destroy
      flash[:success] = 'QuestionCategory has been deleted.'
    else
      flash[:error] = 'QuestionCategory could not be deleted.'
    end
    redirect_to question_categories_url
  end

  protected

  def get_variables
    if params[:id].to_i > 0
      @question_category = QuestionCategory.find(params[:id])
    end
    @question_categories = QuestionCategory.where('id <> ?', params[:id]).all_in_order
    @countries = [] # todo Country.all_in_order
  end

  def allowed_params
    params.require(:question_category).permit(:name, :question_category_id, :active, :created_by, :updated_by, :country_id)
  end

end