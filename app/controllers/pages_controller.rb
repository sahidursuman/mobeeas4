class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :contact, :thanks, :thanks2, :thanks3, :about]
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

	def sponsor
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
    @skill_categories = SkillCategory.includes(:skills)
    # @skills = Skill.all
    @my_skills = current_user.skills
  end

  def thanks
  end

	def thanks2
	end

	def thanks3
	end

  def about
  end

	def host_profile
		@org_user_profile = current_user.org_user_profile
	end

	def organisations_host
		@org_user_profile = current_user.org_user_profile
		@organisations = Organisation.paginate(:page => params[:page], :per_page => 5)
	end

	def organisations_candidate
		@organisations = Organisation.paginate(:page => params[:page], :per_page => 5)
	end

	def purchase_tokens
		@engagement_token_packs = EngagementTokenPack.order(member_price: :asc)
	end

	def required_skills
		@skill_categories = SkillCategory.includes(:skills)
		# @skills = Skill.all
		@opportunity = Opportunity.find(params[:oppo_id])
		@required_skills = @opportunity.skills
	end

	def conversations
		@contact_user = User.find(params[:contact])
		@opportunity
    if @contact_user.has_role? :candidate
      @contact = @contact_user.profile
    elsif @contact_user.has_role? :host
      @contact = @contact_user.org_user_profile
    end
		@messages = Message.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def candidate_profile
	end

	def candidate_reports
		@engagement = Engagement.find(params[:engagement_id])
	end

end
