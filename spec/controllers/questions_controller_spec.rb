require 'spec_helper'
require 'support/users_setup'

describe QuestionsController do

  include_context 'users setup'

  let!(:question_category)  { FactoryGirl.create(:question_category) }
  let!(:question)           { FactoryGirl.create(:question,
                                                 question_category_id: question_category.id)}
  let!(:valid_params)       { { question_category_id: question_category.id,
                                visible_text: 'Vulgaria', publicly_visible: true,
                                created_by: normal_user.id, approved_by: admin_user.id } }

  context 'Use case - not logged in' do

    render_views

    describe "GET 'index' while not logged in" do
      it 'returns http redirect' do
        get 'index'
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "GET 'show' while not logged in" do
      it 'returns http redirect' do
        get 'show', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "GET 'new' while not logged in" do
      it 'returns http redirect' do
        get 'new'
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "POST 'create' while not logged in" do
      it 'returns http redirect' do
        post 'create'
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "GET 'edit' while not logged in" do
      it 'returns http redirect' do
        get 'edit', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "PUT 'update' while not logged in" do
      it 'returns http redirect' do
        put 'update', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "DELETE 'destroy' while not logged in" do
      it 'returns http redirect' do
        delete 'destroy', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

  end

  context 'Use case - logged in as a normal user' do

    render_views

    before(:each) do
      session[:user_id] = normal_user.id
    end

    describe "GET 'index' while logged in as a normal user" do
      it 'returns http redirect' do
        get 'index'
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:questions).first.class.should == Question
        response.status.should == 200
        response.should render_template(:index)
      end
    end

    describe "GET 'show' while logged in as a normal user" do
      it 'returns http redirect' do
        get 'show', id: question.id
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:question).class.should == Question
        response.status.should == 200
        response.should render_template(:show)
      end
    end

    describe "GET 'new' while logged in as a normal user" do
      it 'returns http redirect' do
        get 'new'
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:question).class.should == Question
        response.status.should == 200
        response.should render_template(:new)
      end
    end

    describe "POST 'create' while logged in as a normal user" do
      it 'returns http redirect' do
        post 'create', question: valid_params
        flash[:success].should == 'Question was successfully created.'
        flash[:error].should be_nil
        response.status.should == 302
        response.should redirect_to(questions_url)
      end
    end

    describe "GET 'edit' while logged in as a normal user" do
      it 'returns http redirect' do
        get 'edit', id: question.id
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:question).class.should == Question
        response.status.should == 200
        response.should render_template(:edit)
      end
    end

    describe "PUT 'update' while logged in as a normal user" do
      it 'returns http redirect' do
        put 'update', id: question.id, question: {visible_text: 'Ha ha'}
        flash[:success].should == 'Question was successfully updated.'
        flash[:error].should be_nil
        response.status.should == 302
        response.should redirect_to(questions_url)
      end
    end

    describe "DELETE 'destroy' while logged in as a normal user" do
      it 'returns http redirect' do
        put 'destroy', id: question.id
        flash[:success].should be_nil
        flash[:error].should == 'You must be an administrator to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

  end

  context 'Use case - logged in as an admin user' do

    render_views

    before(:each) do
      session[:user_id] = admin_user.id
    end

    describe "GET 'index' while logged in as an admin user" do
      it 'returns http ok' do
        get 'index'
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:questions).first.class.should == Question
        response.status.should == 200
        response.should render_template('index')
      end
    end

    describe "GET 'show' while logged in as an admin user" do
      it 'returns http ok' do
        get 'show', id: question.id
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:question).class.should == Question
        response.status.should == 200
        response.should render_template('show')
      end
    end

    describe "GET 'new' while logged in as an admin user" do
      it 'returns http ok' do
        get 'new'
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:question).class.should == Question
        response.status.should == 200
        response.should render_template('new')
      end
    end

    describe "POST 'create' while logged in as an admin user" do
      it 'returns http ok' do
        post 'create', question: {name: nil}
        # invalid input
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:question).class.should == Question
        response.status.should == 200
        response.should render_template('new')
      end

      it 'returns http redirect' do
        post 'create', question: valid_params
        # valid input

        flash[:success].should == 'Question was successfully created.'
        flash[:error].should be_nil
        assigns(:question).class.should == Question
        response.status.should == 302
      end
    end

    describe "GET 'edit' while logged in as an admin user" do
      it 'returns http redirect' do
        get 'edit', id: question.id
        flash[:success].should be_nil
        flash[:error].should be_nil
        response.status.should == 200
        assigns(:question).class.should == Question
        response.should render_template('edit')
      end
    end

    describe "PUT 'update' while logged in as an admin user" do
      it 'returns http ok' do
        put 'update', id: question.id , question: {visible_text: ''}
        # invalid input
        flash[:success].should be_nil
        flash[:error].should be_nil
        response.status.should == 200
        assigns(:question).class.should == Question
        response.should render_template('edit')
      end

      it 'returns http redirect' do
        put 'update', id: question.id,
            question: {visible_text: 'United States Dollar'}
        # valid input
        flash[:success].should == 'Question was successfully updated.'
        flash[:error].should be_nil
        assigns(:question).class.should == Question
        response.status.should == 302
      end
    end

    describe "DELETE 'update' while logged in as an admin user" do

      it 'returns http redirect' do
        question_category.questions.delete_all
        delete 'destroy', id: question.id
        flash[:success].should == 'Question has been deleted.'
        flash[:error].should be_nil
        response.status.should == 302
      end
    end

  end

end
