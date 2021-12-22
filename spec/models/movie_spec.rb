require 'rails_helper'

RSpec.describe Movie, type: :model do

  context 'validation' do 
    describe '#content_presence' do 
      it 'should fail if all content blank' do 
        movie = described_class.new 
        movie.valid? 

        expect(movie.errors.full_messages).to include("Title can't be blank", 
                                                        "Title is too short (minimum is 2 characters)",
                                                        "Body can't be blank", 
                                                        "Body is too short (minimum is 25 characters)") 
      end 

      it 'should pass if title presence' do 
        movie = described_class.new(title: "foo")
        movie.valid? 

        expect(movie.errors.full_messages).to include("Body can't be blank", 
                                                      "Body is too short (minimum is 25 characters)") 
      end 

      it 'should pass if body presence' do 
        movie = described_class.new(body: "text 25 simvols, text 25 simvols, text 25 simvols")
        movie.valid? 

        expect(movie.errors.full_messages).to include("Title can't be blank", 
                                                      "Title is too short (minimum is 2 characters)") 
      end 
    end 
  end 
end
