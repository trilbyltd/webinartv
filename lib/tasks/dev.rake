if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      user = create(
        :user,
        name: "Super User",
        email: "admin@webinar.tv",
        password: "password",
      )
      user.user.update!(admin: true)

    end
  end
end
