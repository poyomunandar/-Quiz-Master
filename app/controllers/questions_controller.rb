require 'will_paginate'
require 'will_paginate/array'
require 'to_words'

# Controller class for statistics
class QuestionsController < ApplicationController
  # method for displaying all questions per paginate, called when the menu is clicked
  def index
    @questions = Question.paginate(page: params[:page], per_page: params[:per_page])
  end

  # method for showing a question
  def show
    @questions = Question.find(params[:id])
  end

  # GET /questions/new
  def new
    if params[:kind] == 'Create'
      save
    else
      render 'template'
    end
  end

  # GET /questions/1/edit
  def edit
    if params[:kind] == 'Update'
      save
    else
      @questions = Question.find(params[:id])
      render 'template'
    end
  end

  def save
    if params[:question] == '' || params[:answer] == ''
      flash[:notice] = 'Question and Answer fields are mandatory'
      respond_to do |format|
        format.html { redirect_to :back }
      end
    else
      question = Question.create if params[:kind] == 'Create'
      question = Question.find(params[:id]) if params[:kind] == 'Update'
      question.question = params[:question]
      question.answer = params[:answer]
      question.save!
      flash[:notice] = 'Question was successfully created.' if params[:kind] == 'Create'
      flash[:notice] = 'Question was successfully updated.' if params[:kind] == 'Update'
      respond_to do |format|
        format.html { redirect_to questions_url }
      end
    end
  end

  # DELETE /questions/1
  def destroy
    question = Question.find(params[:id])
    question.destroy
    flash[:notice] = 'Question was successfully deleted.'
    respond_to do |format|
      format.html { redirect_to questions_url }
    end
  end

  # for handling quiz, showing the questions one by one summary the result at the last question
  def quiz
    @questions = Question.all
    @idx = params[:idx] ? (params[:idx].to_i + 1) : 0
    if params[:answer]
      question = Question.find(params[:id])
      if check_answer(params[:answer], question.answer)
        @correct_answer_number = params[:correct_answer_number].to_i + 1
        if @idx < @questions.size
          flash[:notice] = "Correct"
        else
          flash[:notice] = "Correct. Summary: You have answered #{@correct_answer_number} question(s) correctly out of #{@questions.size}"
        end
      else
        @correct_answer_number = params[:correct_answer_number].to_i
        if @idx < @questions.size
          flash[:notice] = "Incorrect"
        else
          flash[:notice] = "Incorrect. Summary: You have answered #{@correct_answer_number} question(s) correctly out of #{@questions.size}"
        end
      end
    else
      @correct_answer_number = 0
    end
    if @idx >= @questions.size
      @idx = 0
      @correct_answer_number = 0
    end
    flash[:notice] = "No questions have been added yet. Please ask the administrator to add some questions first." if @questions.size == 0
  end

  # check answer, including converting first any number to words so for example: ten will be considered too as 10 vice versa
  def check_answer(answer, real_answer)
    modified_real_answer = (real_answer.to_i != 0 && real_answer.to_s != '0') ? real_answer.to_i.to_words.downcase : real_answer
    modified_answer = (answer.to_i != 0 && answer.to_s != '0') ? answer.to_i.to_words.downcase : answer
    modified_real_answer.gsub!(/ and /,'')
    modified_real_answer.gsub!(/[ ,]*/,'')
    modified_answer.gsub!(/ and /,'')
    modified_answer.gsub!(/[ ,]*/,'')
    modified_answer == modified_real_answer ? true : false
  end

end
