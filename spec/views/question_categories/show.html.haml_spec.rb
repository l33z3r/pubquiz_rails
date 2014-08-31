require 'spec_helper'

describe "question_categories/show" do
  before(:each) do
    @question_category = assign(:question_category, stub_model(QuestionCategory,
      :name => "Name",
      :question_category_id => 1,
      :active => false,
      :created_by => 2,
      :updated_by => 3,
      :country_id => 4
    ))
  end

  xit "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
