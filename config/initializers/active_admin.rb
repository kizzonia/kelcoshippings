ActiveAdmin.setup do |config|
  # == Site Title
  #
  # Set the title that is displayed on the main layout
  # for each of the active admin pages.
  #
  config.site_title = "Unknown"

  config.authentication_method = :authenticate_active_admin_user!
  config.current_user_method   = :current_user
  config.logout_link_path      = :destroy_user_session_path
  config.logout_link_method    = :delete




end
