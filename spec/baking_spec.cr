require "./spec_helper"

describe "bake" do
  it do
    `crystal spec/baked.cr -- foo`.should eq "bar\n"
  end

  context "with colons" do
    it do
      `crystal spec/baked.cr -- db:migrate`.should eq "db:migrate\n"
    end
  end
end
