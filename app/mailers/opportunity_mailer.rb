class OpportunityMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.opportunity_mailer.invited.subject
  #

  def contact_candidate(opportunity_id, profile_id)
    @opportunity = Opportunity.find(opportunity_id)
    @profile = Profile.find(profile_id)
    if @opportunity.organisation_id.present?
      @organisation = Organisation.find(@opportunity.organisation_id)
    end
    @host = User.find(@opportunity.user_id)
    mail(to: [@profile.user.email, @host.email], subject: 'You have been contacted by a MOBEEAS Host')
  end


  def invited(opportunity_id, profile_id)
    @opportunity = Opportunity.find(opportunity_id)
    @profile = Profile.find(profile_id)
    mail(to: @profile.user.email, subject: 'You have been invited to participate in MOBEEAS Opportunity')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.opportunity_mailer.accepted.subject
  #
  def accepted(opportunity_id, profile_id)
    @opportunity = Opportunity.find(opportunity_id)
    @profile = Profile.find(profile_id)
    mail(to: @opportunity.user.email, subject: 'A Candidate has accepted your invitation to participate in MOBEEAS Opportunity')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.opportunity_mailer.assigned_a_token.subject
  #
  def assigned_a_token(opportunity_id, profile_id)
    @opportunity = Opportunity.find(opportunity_id)
    @profile = Profile.find(profile_id)
    mail(to: @profile.user.email, subject: 'Your engagement in MOBEEAS Opportunity has been confirmed')
  end

  # This mailer is sent from opportunity by the opp. owner to request purchasing more tokens to the admin host email.
  def purchase_more_tokens(opportunity_id, user_id)
    @opportunity = Opportunity.find(opportunity_id)
    @user = User.find(user_id)
    @requester = User.find(@opportunity.user_id)
    mail(to: [@user.email, @requester.email] , subject: 'Request to purchase MOBEEAS Tokens')

  end

end
