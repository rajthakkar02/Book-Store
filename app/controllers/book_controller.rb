class BookController < ApplicationController
    def create
        @author = Auhtor.new(user_params)
        
    end
end
