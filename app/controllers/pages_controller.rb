class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :contact, :thanks, :faqs, :become_host_candidate_sponsor]
	layout 'home', only: :home
  def home

  end

  def admin_page
    if current_user.has_role? :admin
			if current_user.admin.present?
	      @admin = Admin.find_by(user_id: current_user.id)
			end
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
    @my_skills = current_user.skills
  end

  def thanks
  end

  def faqs
  end

	def host_profile
		@organisations = Organisation.all
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
		@engagement_token_packs = EngagementTokenPack.order(price_ex_gst: :asc)
	end

	def required_skills
		@skill_categories = SkillCategory.includes(:skills)
		# @skills = Skill.all
		if params[:oppo_id].present?
			@opportunity = Opportunity.find(params[:oppo_id])
			@required_skills = @opportunity.skills
		end

	end

	def candidate_profile
	end

	def candidate_reports
		@engagement = Engagement.find(params[:engagement_id])
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

	def search_opportunities
		@skill_categories = SkillCategory.includes(:skills)
	end

	def my_roles
	end

	def contact_candidate
		@opportunity = Opportunity.find(params[:opportunity_id])
		@user_profile = User.find(params[:user_profile])
	end

	def candidate_profile_mini
		@opportunity = Opportunity.find(params[:opportunity_id])
		@user_profile = User.find(params[:user_profile])
	end

	def become_host_candidate_sponsor
		@organisation_pack = SubscriptionPack.find(1)
		@independent_pack = SubscriptionPack.find(2)
		@candidate_pack = SubscriptionPack.find(3)
		@one_token = EngagementTokenPack.find(1)
	end

	def manual_receipt
		@subscription = Subscription.new
		@users = User.all
		@organisations = Organisation.all
	end

end
