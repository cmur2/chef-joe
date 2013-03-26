require 'chefspec'

describe 'joe::syntax' do
  let(:chef_runner) do
    cb_path = [Pathname.new(File.join(File.dirname(__FILE__), '..', '..')).cleanpath.to_s, 'spec/support/cookbooks']
    ChefSpec::ChefRunner.new(:cookbook_path => cb_path)
  end

  let(:chef_run) do
    chef_runner.converge 'joe::syntax'
  end
  
  it 'creates an overlay_dir' do
    expect(chef_run).to create_directory "/usr/local/share/joe/syntax"
  end
  
  it 'creates setup-symlinks script' do
    expect(chef_run).to create_file_with_content "/usr/local/share/joe/syntax/setup-symlinks.sh", "DST=\"/usr/share/joe/syntax\""
  end
  
  it 'sets up symlinks' do
    expect(chef_run).to execute_command "/usr/local/share/joe/syntax/setup-symlinks.sh"
  end
  
  it 'links ftyperc' do
    expect(chef_run).to create_link "/etc/joe/ftyperc"
  end
end
