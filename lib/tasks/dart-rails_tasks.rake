desc "Launch 'pub get'"
namespace :pub do
  task :get do
    system %Q{sh -c "cd #{Rails.root}; pub get"}
  end
end
