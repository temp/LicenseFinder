require_relative '../../support/feature_helper'
require_relative '../../support/testing_dsl'

describe 'Godep Dependencies' do
  # As a Go developer
  # I want to be able to manage Godep dependencies

  let(:go_developer) { LicenseFinder::TestingDSL::User.new }

  specify 'are shown in reports for a project' do
    project = LicenseFinder::TestingDSL::GoProject.create
    ENV['GOPATH'] = "#{project.project_dir}/gopath"

    go_developer.run_license_finder('gopath/src/github.com/pivotal/foo')
    expect(go_developer).to be_seeing_line 'bar, a8d4682, MIT'
  end
end
