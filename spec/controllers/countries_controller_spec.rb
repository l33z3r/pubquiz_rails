require 'spec_helper'
require 'support/users_setup'

describe CountriesController do

  include_context 'users setup'

  let!(:currency)           { FactoryGirl.create(:currency) }
  let!(:country)            { FactoryGirl.create(:country) }
  let!(:valid_params)       { { name: 'Vulgaria', in_the_eu: true,
                                currency_id: currency.id, sorting_order: 25 } }

  context 'Use case - not logged in' do

    render_views

    describe "GET 'index'" do
      it 'returns http redirect' do
        get 'index'
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "GET 'show'" do
      it 'returns http redirect' do
        get 'show', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "GET 'new'" do
      it 'returns http redirect' do
        get 'new'
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "POST 'create'" do
      it 'returns http redirect' do
        post 'create'
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "GET 'edit'" do
      it 'returns http redirect' do
        get 'edit', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "PUT 'update'" do
      it 'returns http redirect' do
        put 'update', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be logged in to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "DELETE 'destroy'" do
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

    describe "GET 'index'" do
      it 'returns http redirect' do
        get 'index'
        flash[:success].should be_nil
        flash[:error].should == 'You must be an administrator to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "GET 'show'" do
      it 'returns http redirect' do
        get 'show', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be an administrator to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "GET 'new'" do
      it 'returns http redirect' do
        get 'new'
        flash[:success].should be_nil
        flash[:error].should == 'You must be an administrator to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "POST 'create'" do
      it 'returns http redirect' do
        post 'create'
        flash[:success].should be_nil
        flash[:error].should == 'You must be an administrator to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "GET 'edit'" do
      it 'returns http redirect' do
        get 'edit', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be an administrator to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "PUT 'update'" do
      it 'returns http redirect' do
        put 'update', id: 1
        flash[:success].should be_nil
        flash[:error].should == 'You must be an administrator to access that page'
        response.status.should == 302
        response.should redirect_to(root_url)
      end
    end

    describe "DELETE 'destroy'" do
      it 'returns http redirect' do
        delete 'destroy', id: 1
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

    describe "GET 'index'" do
      it 'returns http ok' do
        get 'index'
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:countries).first.class.should == Country
        response.status.should == 200
        response.should render_template('index')
      end
    end

    describe "GET 'show'" do
      it 'returns http ok' do
        get 'show', id: country.id
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:country).class.should == Country
        response.status.should == 200
        response.should render_template('show')
      end
    end

    describe "GET 'new'" do
      it 'returns http ok' do
        get 'new'
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:country).class.should == Country
        response.status.should == 200
        response.should render_template('new')
      end
    end

    describe "POST 'create'" do
      it 'returns http ok' do
        post 'create', country: {name: nil}
        # invalid input
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:country).class.should == Country
        response.status.should == 200
        response.should render_template('new')
      end

      it 'returns http redirect' do
        post 'create', country: valid_params
        # valid input

        flash[:success].should == 'Country was successfully created'
        flash[:error].should be_nil
        assigns(:country).class.should == Country
        response.status.should == 302
      end
    end

    describe "GET 'edit'" do
      it 'returns http redirect' do
        get 'edit', id: country.id
        flash[:success].should be_nil
        flash[:error].should be_nil
        response.status.should == 200
        assigns(:country).class.should == Country
        response.should render_template('edit')
      end
    end

    describe "PUT 'update'" do
      it 'returns http ok' do
        put 'update', id: country.id , country: {name: ''}
        # invalid input
        flash[:success].should be_nil
        flash[:error].should be_nil
        response.status.should == 200
        assigns(:country).class.should == Country
        response.should render_template('edit')
      end

      it 'returns http redirect' do
        put 'update', id: country.id,
            country: {name: 'United States'}
        # valid input
        flash[:success].should == 'Country was successfully updated'
        flash[:error].should be_nil
        assigns(:country).class.should == Country
        response.status.should == 302
      end
    end

    describe "DELETE 'update'" do

      let!(:question_category) { FactoryGirl.create(:question_category, country_id: country.id) }

      it 'returns http redirect' do
        delete 'destroy', id: country.id
        flash[:success].should be_nil
        flash[:error].should == 'Country could not be deleted.'
        response.status.should == 302
      end

      it 'returns http redirect' do
        country.question_categories.delete_all
        delete 'destroy', id: country.id
        flash[:success].should == 'Country has been deleted.'
        flash[:error].should be_nil
        response.status.should == 302
      end
    end

  end

end
