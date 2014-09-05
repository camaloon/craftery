describe Feature do
  it { should validate_presence_of :name }
  it { should validate_presence_of :project }
  it { should validate_presence_of :owner }
  it { should ensure_inclusion_of(:state).in_array(Feature::STATES) }

  it "should have default state if not set" do
    subject.state.should be Feature::DEFAULT_STATE
  end
end
