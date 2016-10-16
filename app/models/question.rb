class Question < ActiveRecord::Base

  validates_presence_of :question, :answer

  self.table_name = 'questions'
end