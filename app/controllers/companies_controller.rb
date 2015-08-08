class CompaniesController < ApplicationController
  def match
    if params[:skills].blank?
      flash[:error] = 'Please, choose at least one skill'
      redirect_to root_path
    else
      @companies = Company.with_skills(params[:skills])
      @skills = Skill.find(params[:skills])
    end
  end
end