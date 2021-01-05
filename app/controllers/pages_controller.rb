class PagesController < ApplicationController
  
  def home
    @articles = Article.all.order('created_at DESC')
  end

  def about
  end  

  def dashboard
  end
end 