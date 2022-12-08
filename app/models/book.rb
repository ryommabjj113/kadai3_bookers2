class Book < ApplicationRecord
    
     belongs_to :user
     
     

     validates :title, presence: true
     validates :body, presence: true
     # nameの文字数は、1文字から10文字まで
     validates :body,
     length: { minimum: 1, maximum: 200 }
end
