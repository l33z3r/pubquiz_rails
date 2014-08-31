require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :visible_text => "MyString",
      :correct_answer_id => 1,
      :created_by => 1,
      :updated_by => 1,
      :publicly_visible => false,
      :approved_by => 1
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_path(@question), "post" do
      assert_select "input#question_visible_text[name=?]", "question[visible_text]"
      assert_select "input#question_correct_answer_id[name=?]", "question[correct_answer_id]"
      assert_select "input#question_created_by[name=?]", "question[created_by]"
      assert_select "input#question_updated_by[name=?]", "question[updated_by]"
      assert_select "input#question_publicly_visible[name=?]", "question[publicly_visible]"
      assert_select "input#question_approved_by[name=?]", "question[approved_by]"
    end
  end
end
