class WelcomeController < ApplicationController
  layout "welcome"

  def index
    @intros = Intro.published
     @articles = Article.where(:is_hidden => false).order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end
end
