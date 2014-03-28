require 'chefspec'
begin require 'chefspec/deprecations'; rescue LoadError; end

describe 'joe::default' do
  let(:chef_runner) do
    cb_path = [Pathname.new(File.join(File.dirname(__FILE__), '..', '..')).cleanpath.to_s, 'spec/support/cookbooks']
    ChefSpec::ChefRunner.new(:cookbook_path => cb_path)
  end

  let(:chef_run) do
    chef_runner.converge 'joe::default'
  end
  
  it 'installs joe' do
    expect(chef_run).to install_package 'joe'
  end
end
