require 'spec_helper'

describe "questions/show" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :visible_text => "Visible Text",
      :correct_answer_id => 1,
      :created_by => 2,
      :updated_by => 3,
      :publicly_visible => false,
      :approved_by => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Visible Text/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/false/)
    rendered.should match(/4/)
  end
end
