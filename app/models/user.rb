class User < ActiveRecord::Base
  include Clearance::User

  private

  def adminitize!
    update!(admin: true)
  end
end
