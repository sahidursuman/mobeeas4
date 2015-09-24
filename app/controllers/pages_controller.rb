class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :contact]
	layout 'home', only: :home
  def home
  end

  def admin
    if current_user.has_role? :admin
      @users = User.includes(:profile)
    else
      redirect_to root_path
    end
  end

  def contact
  end

  def welcome
  end

  def find_organisation
  	@organisation_types = OrganisationType.all
  	if params[:search]
      @organisations = Organisation.search(params[:search]).order("created_at DESC")
    # else
    #   @organisations = Organisation.all.order('created_at DESC')
    end
    if params[:org_type]
    	@org_type = Organisation.find(params[:org_type])
    end
  end

  def my_skills
    @skill_categories = SkillCategory.includes(:skills).order(name: :asc)
    # @skills = Skill.all
    @my_skills = current_user.skills
  end
end
