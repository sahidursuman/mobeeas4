class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :contact]
	# layout 'devise', except: :admin
  def home
  end

  def admin
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
    @skill_categories = SkillCategory.all
    @skills = Skill.all
  end
end
