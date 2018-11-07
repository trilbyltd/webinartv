RSpec.configure do |config|
  config.include ActionView::Helpers::TranslationHelper
  config.include AbstractController::Translation
end
