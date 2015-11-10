class OrgUser < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :user

  scope :admin_user,->{where(admin_status: true, verified_status: true)}
  scope :host_user,->{where(admin_status: false, verified_status: true)}

end
