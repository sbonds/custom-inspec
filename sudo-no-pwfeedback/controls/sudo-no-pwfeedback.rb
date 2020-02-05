# encoding: utf-8
# copyright: 2020, Steve Bonds

title 'sudo no pwfeedback'

# you add controls here
control 'sudo-v-ok' do
  impact 1.0
  title 'Check sudo -V output'
  desc 'Run sudo -V and check stdout'
  describe command('sudo -V') do
    its('stdout') { should_not match /feedback/ }
    # The below ensures we're getting the full output from running as root
    its('stdout') { should match /Sudoers path: / }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
