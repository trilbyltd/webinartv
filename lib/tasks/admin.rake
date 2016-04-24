namespace :admin do
  desc "Make a user an admin"
  task toggle: :environment do
    print "What is the email address of the user? "
    user = User.find_by!(email: $stdin.gets.strip)
    user.toggle!(:admin)
    print "#{user.email}'s admin status is now #{user.admin}\n"
  end

end
