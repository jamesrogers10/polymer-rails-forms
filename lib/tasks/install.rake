namespace :polymer_rails_forms do
  	desc 'Installs the polymer rails-forms element to vendor/assets/components/rails-forms'
	task :install do
	  cp_r "#{File.dirname(__FILE__)}/../../assets/rails-forms/.", "#{Dir.pwd}/vendor/assets/components/rails-forms"
	end
end