class WelcomeController < ApplicationController
  def index
    flash[:warning] = "我黄了的鸟"
  end
end
