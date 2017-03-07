class StaticpagesController < ApplicationController
  def about
  end

  def contact
    @feedback = Feedback.new
  end

  def home
    @image_for_slider = Image.all.select do |image|
      image.photo.image_width >= 950 && image.photo.image_height >= 600
    end.sort_by{ rand }.first(3)
  end
end
