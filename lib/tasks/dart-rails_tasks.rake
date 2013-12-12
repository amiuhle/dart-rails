namespace :pub do
  desc 'Launch "pub get"'
  task :get => :environment do
    if root = ENV['DART_SDK_HOME']
      file = File.join(root, 'bin', 'pub')
      pub = file if File.exist?(file)
    end
    pub ||= (system('pub -h') ? 'pub' : false)
    system %Q{sh -c "cd #{Rails.root.join('app', 'assets', 'darts')}; #{pub} get"}
  end
end
