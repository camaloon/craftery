describe ApplicationHelper do
  describe "bootstrap_flash_type" do
    it { helper.bootstrap_flash_type('alert').should eq 'danger' }
  end

  describe "user_flash_type" do
    it { helper.user_flash_type('alert').should eq 'Warning' }
  end
end
