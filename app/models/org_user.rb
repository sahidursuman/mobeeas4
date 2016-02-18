class OrgUser < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :user

  scope :admin_user,->{where(admin_status: true, verified_status: true)}
  scope :host_user,->{where(admin_status: false, verified_status: true)}

  def is_admin_user
    (self.admin_status) && (self.verified_status)
  end

  def is_host_user
    !(self.admin_status) && (self.verified_status)
  end

end
