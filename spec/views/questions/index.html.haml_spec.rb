require 'spec_helper'

describe "questions/index" do
  before(:each) do
    assign(:questions, [
      stub_model(Question,
        :visible_text => "Visible Text",
        :correct_answer_id => 1,
        :created_by => 2,
        :updated_by => 3,
        :publicly_visible => false,
        :approved_by => 4
      ),
      stub_model(Question,
        :visible_text => "Visible Text",
        :correct_answer_id => 1,
        :created_by => 2,
        :updated_by => 3,
        :publicly_visible => false,
        :approved_by => 4
      )
    ])
  end

  xit "renders a list of questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Visible Text".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
