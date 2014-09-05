describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :username }
end
