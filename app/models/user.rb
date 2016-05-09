class User < ActiveRecord::Base
  include Clearance::User

  private

  def adminitize!
    self.update!(admin: true)
  end
end
