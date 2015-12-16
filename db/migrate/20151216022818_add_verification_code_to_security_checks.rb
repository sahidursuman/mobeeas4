class AddVerificationCodeToSecurityChecks < ActiveRecord::Migration
  def change
    add_column :security_checks, :verification_code, :string, default: 'not verified'
  end
end
