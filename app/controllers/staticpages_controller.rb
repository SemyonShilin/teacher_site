class StaticpagesController < ApplicationController
  def about
  end

  def contact
    @feedback = Feedback.new
  end

  def home
    # @image_for_slider = Image.all.map do |image|
    #   image if image.photo.image_width > 600 && image.photo.image_height > 1200
    # end.sort_by{ rand }.first(3)
    @image_for_slider = Image.all.order('RANDOM()').take(3)
  end
end
