require 'spec_helper'

describe QuestionCategoriesController do
  describe 'routing' do

    it 'routes to #index' do
      get('/question_categories').should route_to('question_categories#index')
    end

    it 'routes to #new' do
      get('/question_categories/new').should route_to('question_categories#new')
    end

    it 'routes to #show' do
      get('/question_categories/1').should route_to('question_categories#show', :id => '1')
    end

    it 'routes to #edit' do
      get('/question_categories/1/edit').should route_to('question_categories#edit', :id => '1')
    end

    it 'routes to #create' do
      post('/question_categories').should route_to('question_categories#create')
    end

    it 'routes to #update' do
      put('/question_categories/1').should route_to('question_categories#update', :id => '1')
    end

    it 'routes to #destroy' do
      delete('/question_categories/1').should route_to('question_categories#destroy', :id => '1')
    end

  end
end
