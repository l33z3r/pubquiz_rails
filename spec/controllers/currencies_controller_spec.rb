require 'spec_helper'
require 'support/users_setup'

describe CurrenciesController do

  include_context 'users setup'

  let!(:currency)           { FactoryGirl.create(:currency) }
  let!(:currency)            { FactoryGirl.create(:currency) }
  let!(:valid_params)       { { name: 'Scottish Pound', iso_code: 'SLP',
                                leading_symbol: '£',
                                trailing_symbol: 'p',
                                thousands_separator: ',',
                                decimal_separator: '.',
                                active: true,
                                sorting_order: 25 } }

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
        assigns(:currencies).first.class.should == Currency
        response.status.should == 200
        response.should render_template('index')
      end
    end

    describe "GET 'show'" do
      it 'returns http ok' do
        get 'show', id: currency.id
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:currency).class.should == Currency
        response.status.should == 200
        response.should render_template('show')
      end
    end

    describe "GET 'new'" do
      it 'returns http ok' do
        get 'new'
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:currency).class.should == Currency
        response.status.should == 200
        response.should render_template('new')
      end
    end

    describe "POST 'create'" do
      it 'returns http ok' do
        post 'create', currency: {name: nil}
        # invalid input
        flash[:success].should be_nil
        flash[:error].should be_nil
        assigns(:currency).class.should == Currency
        response.status.should == 200
        response.should render_template('new')
      end

      it 'returns http redirect' do
        post 'create', currency: valid_params
        # valid input

        flash[:success].should == 'Currency was successfully created.'
        flash[:error].should be_nil
        assigns(:currency).class.should == Currency
        response.status.should == 302
      end
    end

    describe "GET 'edit'" do
      it 'returns http redirect' do
        get 'edit', id: currency.id
        flash[:success].should be_nil
        flash[:error].should be_nil
        response.status.should == 200
        assigns(:currency).class.should == Currency
        response.should render_template('edit')
      end
    end

    describe "PUT 'update'" do
      it 'returns http ok' do
        put 'update', id: currency.id , currency: {name: ''}
        # invalid input
        flash[:success].should be_nil
        flash[:error].should be_nil
        response.status.should == 200
        assigns(:currency).class.should == Currency
        response.should render_template('edit')
      end

      it 'returns http redirect' do
        put 'update', id: currency.id,
            currency: {name: 'United States'}
        # valid input
        flash[:success].should == 'Currency was successfully updated.'
        flash[:error].should be_nil
        assigns(:currency).class.should == Currency
        response.status.should == 302
      end
    end

    describe "DELETE 'update'" do

      let!(:country) { FactoryGirl.create(:country, currency_id: currency.id) }

      it 'returns http redirect' do
        delete 'destroy', id: currency.id
        flash[:success].should be_nil
        flash[:error].should == 'Currency was not deleted'
        response.status.should == 302
      end

      it 'returns http redirect' do
        currency.countries.delete_all
        delete 'destroy', id: currency.id
        flash[:success].should == 'Currency was successfully deleted'
        flash[:error].should be_nil
        response.status.should == 302
      end
    end

  end

end
