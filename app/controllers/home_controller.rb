class HomeController < ApplicationController
  def show
    @skills = Skill.more_frequent_used.ordered
  end
end