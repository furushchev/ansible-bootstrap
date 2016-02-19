require 'serverspec'

set :backend, :exec

expected_packages = %w[
  emacs24-nox
  vim-nox
  git
  wget
  ssh
]

expected_packages.each do |expected_package|
  describe package(expected_package) do
    it { should be_installed }
  end
end

describe file('/usr/local/bin/hub') do
  it { should be_file }
  it { should be_executable }
end
