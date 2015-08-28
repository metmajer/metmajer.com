require 'serverspec'

set :backend, :exec

describe command('ufw status verbose') do
  its(:stdout) { should contain('Status: active') }
  its(:stdout) { should contain('Logging: off') }
  its(:stdout) { should contain('Default: deny') }
  its(:stdout) { should contain('ALLOW').after('SSH') }
  its(:stdout) { should contain('ALLOW').after('WWW') }
end
