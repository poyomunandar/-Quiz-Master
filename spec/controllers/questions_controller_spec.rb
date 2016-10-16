require 'spec_helper'

describe 'module' do

  describe 'quiz' , type: :request do
    before(:all) do
      @question = FactoryGirl.create(:question)
    end

    it 'should display quiz page' do
      get "/quiz"
      expect(response.body).to match("Quiz Mode</h1>")
    end
    it 'should display Correct message' do
      post "/quiz", :answer => 'one'
      expect(response.body).to match("Correct")
    end
    it 'should display Correct message' do
      post "/quiz", :answer => '1'
      expect(response.body).to match("Correct")
    end
    it 'should display Inorrect message' do
      post "/quiz", :answer => 'two'
      expect(response.body).to match("Inorrect")
    end
    it 'should display message: No questions have been added yet. Please ask the administrator to add some questions first' do
      @question.destroy
      get "/quiz"
      expect(response.body).to match("No questions have been added yet. Please ask the administrator to add some questions first")
    end
  end

  describe 'questions' , type: :request do
    before(:all) do
      @question = FactoryGirl.create(:question)
    end

    it 'should display index page' do
      get '/questions'
      expect(response.body).to match("Manage Questions</h1>")
    end
    it 'should display show question page' do
      get "/questions/#{@question.id}"
      expect(response.body).to match("Show Question</h1>")
    end
    it 'should display new question page' do
      get '/questions/new'
      expect(response.body).to match("New Question</h1>")
    end
    it 'should display edit question page' do
      get "/questions/#{@question.id}/edit"
      expect(response.body).to match("Editing Question</h1>")
    end
    it 'should display: Question was successfully updated' do
      post "/questions/#{@question.id}/edit", :question => 'who are you?', :answer => 'me', :kind => 'update'
      expect(response.body).to match("Question was successfully updated")
    end
    it 'should display: Question was successfully created' do
      post "/questions/new", :question => 'who are you?', :answer => 'me'
      expect(response.body).to match("Question was successfully created")
    end
    it 'should display: Question was successfully deleted' do
      delete "/questions/#{@question.id}"
      expect(response.body).to match("Question was successfully deleted")
    end
  end

end

