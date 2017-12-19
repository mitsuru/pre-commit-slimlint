=begin
Copyright 2017 mitz hayasaka.mitsuru@gmail.com

See the file LICENSE for copying permission.
=end

require 'minitest_helper'
require 'plugins/pre_commit/checks/slimlint'

describe PreCommit::Checks::Slimlint do
  let(:check){ PreCommit::Checks::Slimlint.new(nil, nil, []) }

  it "does nothing" do
    check.send(:run_check, "rake").must_equal(nil)
  end

  it "checks files" do
    Dir.chdir(test_files) do
      # TODO: create example files in test/files
      check.send(:run_check, ".keep").must_equal(nil)
    end
  end

end
