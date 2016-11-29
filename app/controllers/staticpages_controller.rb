class StaticpagesController < ApplicationController
  def about
  end

  def contact
  end

  def home
    @image_for_slider = Image.all.order('RANDOM()').take(3)
  end
end
