class EnvironmentLoader
  def self.run
    home_directory = File.expand_path('~/')
    Dir.chdir(home_directory) { Dotenv.load }
  end
end
