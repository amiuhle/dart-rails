require 'rails/generators/named_base'

namespace :pub do
  desc 'Launch "pub get"'
  task :get do
    if root = ENV['DART_SDK_HOME']
      file = File.join(root, 'bin', 'pub')
      pub = file if File.exist?(file)
    end
    pub ||= (system('pub -h') ? 'pub' : false)
    system %Q{sh -c "cd #{File.join(Rails.root, 'app', 'assets', 'darts')}; #{pub} get"}
  end
end
