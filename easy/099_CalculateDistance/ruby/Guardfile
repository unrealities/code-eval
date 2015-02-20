# A sample Guardfile
# More info at https://github.com/guard/guard#readme
interactor :simple
notification :gntp, sticky: true, host: '192.168.1.2', password: 'sendgrid'

guard :rspec, cmd: 'bundle exec rspec', all_on_start: false, all_after_pass: false, failed_mode: :none do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

logger level:       :error,
       template:    '[:severity - :time - :progname] :message',
       time_format: 'at %I:%M%p'