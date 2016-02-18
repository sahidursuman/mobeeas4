class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :contact, :thanks, :about]
	layout 'home', only: :home
  def home
  end

  def admin_page
    if current_user.has_role? :admin
			if current_user.admins.present?
	      @admin = Admin.find_by(user_id: current_user.id)
			end
    else
      redirect_to root_path
    end
  end

	def sponsor_page
    if current_user.has_role? :sponsor
			@sponsor = Sponsor.find_by(user_id: current_user.id)
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

  def about
  end

	def host_profile
		# this params is coming from profiles/index.html.erb page where Admin can view a candidate's profile
	 	if params[:viewer] == 'admin'
			@org_user_profile = OrgUserProfile.find(params[:org_user_profile_id])
		# this params will not appear if the candidate is viewing his/her own profile page
	 	elsif !(params[:viewer] == 'admin')
		 	@org_user_profile = current_user.org_user_profile
	 end
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

	def site_administration
		if current_user.has_role? :master_admin
			@admins = Admin.all
		else
			redirect_to root_path
		end
	end

	def admin_candidates
	end
	def admin_hosts
	end
	def admin_sponsors
	end
	def unverified_education
		@educations = Education.unverified
	end
	def unverified_wwc
		@security_checks = SecurityCheck.unverified
	end

	def independent_host
	end

	def income
		@engagement_token_packs = EngagementTokenPack.all
		@subscription_packs = SubscriptionPack.all
		 if params[:organisation] == 'active'
		 	@subscriptions = Subscription.organisation
		 end
	end

end
